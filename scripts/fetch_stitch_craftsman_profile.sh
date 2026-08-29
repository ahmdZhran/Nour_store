#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
KEY_FILE="$ROOT/.cursor/stitch_api_key"

if [[ ! -f "$KEY_FILE" ]]; then
  echo "Missing $KEY_FILE" >&2
  exit 1
fi

STITCH_API_KEY="$(tr -d '[:space:]' < "$KEY_FILE")"
PROJECT_ID="9869083255109415439"
SCREEN_ID="bccaba5bb28942ad9f4620f75aef002e"
OUT_DIR="$ROOT/assets/design/stitch"
IMG_DIR="$ROOT/assets/images/craftsman_profile"

mkdir -p "$OUT_DIR" "$IMG_DIR"

RESPONSE="$(curl -sS -X POST "https://stitch.googleapis.com/mcp" \
  -H "Content-Type: application/json" \
  -H "X-Goog-Api-Key: $STITCH_API_KEY" \
  -d "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"tools/call\",\"params\":{\"name\":\"get_screen\",\"arguments\":{\"projectId\":\"$PROJECT_ID\",\"screenId\":\"$SCREEN_ID\"}}}")"

printf '%s' "$RESPONSE" > "$OUT_DIR/craftsman_profile_get_screen_response.json"

python3 - "$OUT_DIR" "$IMG_DIR" <<'PY'
import json, re, sys, urllib.request
from pathlib import Path

out_dir = Path(sys.argv[1])
img_dir = Path(sys.argv[2])
data = json.loads((out_dir / "craftsman_profile_get_screen_response.json").read_text())

def extract_nested_text(obj):
    if isinstance(obj, dict):
        if "text" in obj and isinstance(obj["text"], str):
            try:
                return json.loads(obj["text"])
            except json.JSONDecodeError:
                return obj["text"]
        for v in obj.values():
            result = extract_nested_text(v)
            if result is not None:
                return result
    elif isinstance(obj, list):
        for item in obj:
            result = extract_nested_text(item)
            if result is not None:
                return result
    return None

payload = extract_nested_text(data) or data

def find_urls(obj, urls=None):
    urls = urls or set()
    if isinstance(obj, dict):
        for k, v in obj.items():
            if k in ("downloadUrl", "url") and isinstance(v, str) and v.startswith("http"):
                urls.add(v)
            else:
                find_urls(v, urls)
    elif isinstance(obj, list):
        for item in obj:
            find_urls(item, urls)
    return urls

urls = sorted(find_urls(payload))
screenshot = None
html = None
for url in urls:
    lower = url.lower()
    if screenshot is None and "lh3.googleusercontent.com" in lower:
        screenshot = url
    if html is None and ("html" in lower or "usercontent.google.com/download" in lower):
        html = url

if screenshot:
    dest = out_dir / "craftsman_profile_reference.png"
    urllib.request.urlretrieve(screenshot, dest)
    print(f"Downloaded screenshot -> {dest}")

if html:
    dest = out_dir / "craftsman_profile.html"
    urllib.request.urlretrieve(html, dest)
    print(f"Downloaded html -> {dest}")
    content = dest.read_text(errors="ignore")
    img_urls = re.findall(r'<img[^>]+src=["\'](https?://[^"\']+)["\']', content, flags=re.I)
    for i, url in enumerate(dict.fromkeys(img_urls)):
        ext = "jpg"
        if "." in url.split("?")[0].split("/")[-1]:
            candidate = url.split("?")[0].split(".")[-1].lower()
            if candidate in {"jpg", "jpeg", "png", "webp"}:
                ext = candidate
        target = img_dir / f"portfolio_{i + 1}.{ext}"
        urllib.request.urlretrieve(url, target)
        print(f"Downloaded image -> {target}")
PY
