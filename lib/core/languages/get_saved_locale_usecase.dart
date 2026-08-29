import 'package:nour_store/core/languages/locale_repository.dart';

class GetSavedLocaleUseCase {
  const GetSavedLocaleUseCase(this._repository);

  final LocaleRepository _repository;

  Future<String> call() => _repository.getSavedLanguageCode();
}
