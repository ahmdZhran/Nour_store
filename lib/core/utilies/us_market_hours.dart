/// US regular equity session in UTC (Mon–Fri 13:30–20:00 = 9:30–16:00 ET).
abstract final class UsMarketHours {
  static const int _openMinute = 13 * 60 + 30;
  static const int _closeMinute = 20 * 60;

  /// Interval used by markets table and watchlist polling.
  /// Kept intentionally above FMP quote pressure on starter plans.
  static const Duration pollInterval = Duration(seconds: 30);

  static bool isLikelyOpen([DateTime? utcNow]) {
    final now = utcNow ?? DateTime.now().toUtc();
    if (now.weekday > DateTime.friday) return false;
    final minutes = now.hour * 60 + now.minute;
    return minutes >= _openMinute && minutes < _closeMinute;
  }
}
