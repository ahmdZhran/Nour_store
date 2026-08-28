import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/core/local/shared_pref_helper.dart';

abstract class LocaleRepository {
  Future<String> getSavedLanguageCode();

  Future<void> saveLanguageCode(String code);
}

class LocaleRepositoryImpl implements LocaleRepository {
  LocaleRepositoryImpl();

  static const languageKey = 'app_language';

  @override
  Future<String> getSavedLanguageCode() async {
    final saved = await SharedPrefHelper.getString(languageKey);
    if (saved == LangCode.englishCode || saved == LangCode.arabicCode) {
      return saved;
    }
    return LangCode.arabicCode;
  }

  @override
  Future<void> saveLanguageCode(String code) async {
    final normalized = code == LangCode.englishCode
        ? LangCode.englishCode
        : LangCode.arabicCode;
    await SharedPrefHelper.setData(languageKey, normalized);
  }
}
