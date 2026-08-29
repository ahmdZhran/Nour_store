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
SCREEN_ID="98e64509b62845c7ae2a9215789f11eb"
OUT_DIR="$ROOT/assets/design/stitch"
IMG_DIR="$ROOT/assets/images/gateway"

mkdir -p "$OUT_DIR" "$IMG_DIR"

RESPONSE="$(curl -sS -X POST "https://stitch.googleapis.com/mcp" \
  -H "Content-Type: application/json" \
  -H "X-Goog-Api-Key: $STITCH_API_KEY" \
  -d "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"tools/call\",\"params\":{\"name\":\"get_screen\",\"arguments\":{\"projectId\":\"$PROJECT_ID\",\"screenId\":\"$SCREEN_ID\"}}}")"

printf '%s' "$RESPONSE" > "$OUT_DIR/get_screen_response.json"

python3 - "$OUT_DIR" "$IMG_DIR" <<'PY'
import json, re, sys, urllib.request
from pathlib import Path

out_dir = Path(sys.argv[1])
img_dir = Path(sys.argv[2])
data = json.loads((out_dir / "get_screen_response.json").read_text())

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

urls = sorted(find_urls(data))
meta = {"urls": urls}
(out_dir / "urls.json").write_text(json.dumps(meta, indent=2))

screenshot = None
html = None
for url in urls:
    lower = url.lower()
    if screenshot is None and any(x in lower for x in (".png", ".jpg", ".jpeg", ".webp", "screenshot")):
        screenshot = url
    if html is None and (".html" in lower or "html" in lower):
        html = url

if screenshot:
    dest = out_dir / "gateway_reference.png"
    urllib.request.urlretrieve(screenshot, dest)
    print(f"Downloaded screenshot -> {dest}")

if html:
    dest = out_dir / "gateway.html"
    urllib.request.urlretrieve(html, dest)
    print(f"Downloaded html -> {dest}")
    content = dest.read_text(errors="ignore")
    image_urls = re.findall(r'https?://[^"\')\s>]+\.(?:png|jpg|jpeg|webp)', content, flags=re.I)
    names = ["store", "services", "marketplace"]
    for i, url in enumerate(dict.fromkeys(image_urls)[:3]):
        ext = url.split("?")[0].split(".")[-1].lower()
        target = img_dir / f"{names[i] if i < len(names) else f'card_{i}'}.{ext}"
        urllib.request.urlretrieve(url, target)
        print(f"Downloaded card image -> {target}")
PY
