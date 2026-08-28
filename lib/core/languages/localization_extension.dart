import 'package:flutter/widgets.dart';
import 'package:nour_store/core/languages/app_localization.dart';

extension LocalizationX on BuildContext {
  String tr(String key) =>
      AppLocalizations.of(this)?.translate(key) ?? key;
}
