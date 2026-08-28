import 'package:flutter/widgets.dart';
import 'package:nour_store/core/languages/app_localization.dart';
import 'package:nour_store/core/languages/lang_code.dart';

extension LocalizationX on BuildContext {
  String tr(String key) =>
      AppLocalizations.of(this)?.translate(key) ?? key;

  /// Whether the current layout direction is RTL (Arabic-first).
  bool get isRtl => Directionality.of(this) == TextDirection.rtl;

  /// Whether the current layout direction is LTR (English).
  bool get isLtr => !isRtl;

  /// Resolves text direction from the active app locale.
  TextDirection get localeTextDirection =>
      _languageCode == LangCode.arabicCode
          ? TextDirection.rtl
          : TextDirection.ltr;

  String get _languageCode =>
      Localizations.localeOf(this).languageCode;
}
