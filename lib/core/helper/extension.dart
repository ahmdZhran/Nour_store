import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    RoutePredicate? predicate,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      predicate ?? (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  void pop() {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop();
    }
  }
}

extension DateFormattingExtension on dynamic {
  String toBackendDateFormat() {
    if (this is DateTime) {
      return DateFormat('yyyy-MM-dd').format(this as DateTime);
    } else if (this is String) {
      try {
        final date = DateFormat('dd/MM/yyyy').parse(this as String);
        return DateFormat('yyyy-MM-dd').format(date);
      } catch (e) {
        debugPrint('Error formatting date for backend: $e');
        return this as String;
      }
    }
    throw ArgumentError('Input must be either DateTime or String');
  }
}

extension TimeFormattingExtension on TimeOfDay {
  String formatTo12Hour() {
    final hour = hourOfPeriod == 0 ? 12 : hourOfPeriod;
    final minuteStr = minute.toString().padLeft(2, '0');
    final periodStr = period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minuteStr $periodStr';
  }

  String formatTo24Hour() {
    final hourStr = hour.toString().padLeft(2, '0');
    final minuteStr = minute.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr';
  }
}

extension DateFormattingExtension2 on DateTime {
  String formatToDisplay() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String formatToBackend() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String formatPretty() {
    return DateFormat('dd MMM yyyy').format(this);
  }
}

extension TimeStringFormatting on String {
  String to12HourFormat() {
    try {
      final time = DateFormat('HH:mm:ss').parse(this);
      return DateFormat('h:mm a').format(time);
    } catch (_) {
      return this;
    }
  }
}

