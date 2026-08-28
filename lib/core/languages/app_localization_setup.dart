import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/core/languages/app_localization.dart';

class AppLocalizationsSetup {
  static const Iterable<Locale> supportedLocales = [
    Locale(LangCode.arabicCode),
    Locale(LangCode.englishCode),
  ];

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
  ];

  static Locale? localeResolutionCallback(
    Locale? locale,
    Iterable<Locale>? supportedLocales,
  ) {
    final supported = supportedLocales;
    if (supported == null || supported.isEmpty) {
      return const Locale(LangCode.arabicCode);
    }

    if (locale == null) {
      return supported.first;
    }

    for (final supportedLocale in supported) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return supportedLocale;
      }
    }

    return supported.first;
  }
}
