import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nour_store/core/api/dio_consumer.dart';
import 'package:nour_store/core/languages/get_saved_locale_usecase.dart';
import 'package:nour_store/core/languages/locale_cubit.dart';
import 'package:nour_store/core/languages/locale_repository.dart';
import 'package:nour_store/core/languages/save_locale_usecase.dart';
import 'package:nour_store/core/utilies/google_auth_config.dart';


final getIt = GetIt.instance;

class ServiceLocator {
  static Future<void> setup() async {
    // Reset so hot restart picks up new registrations cleanly.
    await getIt.reset();

    // 1. Register base dependencies first
    getIt.registerLazySingleton<Dio>(() => Dio());

    // 2. Register DioConsumer (depends on Dio)
    getIt.registerLazySingleton<DioConsumer>(
      () => DioConsumer(dio: getIt<Dio>()),
    );

    // 2b. Locale (app-wide)
    getIt.registerLazySingleton<LocaleRepository>(LocaleRepositoryImpl.new);
    getIt.registerLazySingleton<GetSavedLocaleUseCase>(
      () => GetSavedLocaleUseCase(getIt<LocaleRepository>()),
    );
    getIt.registerLazySingleton<SaveLocaleUseCase>(
      () => SaveLocaleUseCase(getIt<LocaleRepository>()),
    );
    getIt.registerLazySingleton<LocaleCubit>(
      () => LocaleCubit(
        getIt<GetSavedLocaleUseCase>(),
        getIt<SaveLocaleUseCase>(),
      ),
    );
  }
}
