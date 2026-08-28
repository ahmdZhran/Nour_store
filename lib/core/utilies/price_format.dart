import 'package:intl/intl.dart';

/// Formats USD prices: 2 cent digits at or above $1, 4 below $1.
class PriceFormat {
  const PriceFormat._();

  static int decimalDigits(double price) => price >= 1 ? 2 : 4;

  static String currency(double value, {double? basedOn}) {
    return NumberFormat.currency(
      locale: 'en_US',
      symbol: r'$',
      decimalDigits: decimalDigits(basedOn ?? value),
    ).format(value);
  }

  static String plain(double value, {double? basedOn}) {
    final digits = decimalDigits(basedOn ?? value);
    final pattern = digits == 2 ? '#,##0.00' : '#,##0.0000';
    return NumberFormat(pattern, 'en_US').format(value);
  }
}
