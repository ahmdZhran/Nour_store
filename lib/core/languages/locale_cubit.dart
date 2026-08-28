import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nour_store/core/languages/get_saved_locale_usecase.dart';
import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/core/languages/locale_repository.dart';
import 'package:nour_store/core/languages/locale_state.dart';
import 'package:nour_store/core/languages/save_locale_usecase.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(
    this._getSavedLocale,
    this._saveLocale,
  ) : super(const LocaleInitial());

  /// SharedPreferences key for the selected app language.
  static const languageKey = LocaleRepositoryImpl.languageKey;

  final GetSavedLocaleUseCase _getSavedLocale;
  final SaveLocaleUseCase _saveLocale;

  Future<void> load() async {
    final code = await _getSavedLocale();
    emit(LocaleLoaded(code));
  }

  Future<void> setLanguage(String code) async {
    final normalized = code == LangCode.englishCode
        ? LangCode.englishCode
        : LangCode.arabicCode;
    await _saveLocale(normalized);
    emit(LocaleLoaded(normalized));
  }
}
