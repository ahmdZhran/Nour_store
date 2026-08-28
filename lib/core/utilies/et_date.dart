/// America/New_York calendar helpers for strategy scan document ids.
abstract final class EtDate {
  /// Formats [utcNow] (or now) as `YYYY-MM-DD` in America/New_York.
  static String format([DateTime? utcNow]) {
    final utc = (utcNow ?? DateTime.now()).toUtc();
    final offsetHours = isEasternDaylightTime(utc) ? 4 : 5;
    final et = utc.subtract(Duration(hours: offsetHours));
    final y = et.year.toString().padLeft(4, '0');
    final m = et.month.toString().padLeft(2, '0');
    final d = et.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

  /// US daylight-saving window for America/New_York (second Sunday of March
  /// 02:00 local through first Sunday of November 02:00 local).
  static bool isEasternDaylightTime(DateTime utc) {
    final year = utc.year;
    final dstStart = _nthSundayOfMonthUtc(year, 3, 2, hourEt: 2, offsetHours: 5);
    final dstEnd = _nthSundayOfMonthUtc(year, 11, 1, hourEt: 2, offsetHours: 4);
    return !utc.isBefore(dstStart) && utc.isBefore(dstEnd);
  }

  static DateTime _nthSundayOfMonthUtc(
    int year,
    int month,
    int nth, {
    required int hourEt,
    required int offsetHours,
  }) {
    var day = DateTime.utc(year, month, 1);
    final sundays = <DateTime>[];
    while (day.month == month) {
      if (day.weekday == DateTime.sunday) {
        sundays.add(day);
      }
      day = day.add(const Duration(days: 1));
    }
    final localSunday = sundays[nth - 1];
    return DateTime.utc(
      localSunday.year,
      localSunday.month,
      localSunday.day,
      hourEt + offsetHours,
    );
  }
}

/// Builds `strategy_scans` document id: `{strategyId}_{YYYY-MM-DD}`.
String strategyScanDocId(String strategyId, String marketDate) {
  final safeStrategy = strategyId.trim().replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_');
  final safeDate = marketDate.trim().replaceAll(RegExp(r'[^0-9-]'), '');
  final strategy = safeStrategy.isEmpty ? 'unknown' : safeStrategy;
  final date = safeDate.isEmpty ? 'unknown' : safeDate;
  return '${strategy}_$date';
}
