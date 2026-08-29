import 'package:nour_store/core/languages/locale_repository.dart';

class SaveLocaleUseCase {
  const SaveLocaleUseCase(this._repository);

  final LocaleRepository _repository;

  Future<void> call(String code) => _repository.saveLanguageCode(code);
}
