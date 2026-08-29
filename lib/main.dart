import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nour_store/core/languages/app_localization_setup.dart';
import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/core/languages/locale_cubit.dart';
import 'package:nour_store/core/languages/locale_state.dart';
import 'package:nour_store/core/routes/app_router.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/core/theme/app_theme.dart';
import 'package:nour_store/core/utilies/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.setup();
  await getIt<LocaleCubit>().load();
  runApp(const NourStoreApp());
}

class NourStoreApp extends StatelessWidget {
  const NourStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<LocaleCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        builder: (context, child) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, state) {
              final locale = switch (state) {
                LocaleLoaded(:final languageCode) =>
                  Locale(languageCode),
                _ => const Locale(LangCode.arabicCode),
              };

              return MaterialApp(
                title: 'Nour Store',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: ThemeMode.dark,
                locale: locale,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: Routes.mainSelection,
              );
            },
          );
        },
      ),
    );
  }
}
