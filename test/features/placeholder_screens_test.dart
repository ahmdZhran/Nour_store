import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nour_store/core/languages/app_localization_setup.dart';
import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/features/services/presentation/screens/services_home_screen.dart';
import 'package:nour_store/features/store/presentation/pages/store_home_screen.dart';

void main() {
  testWidgets('placeholder screens render without overflow on desktop web width', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1200, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    Future<void> pumpScreen(Widget screen) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          builder: (context, child) => MaterialApp(
            locale: const Locale(LangCode.arabicCode),
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            home: screen,
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    await pumpScreen(const StoreHomeScreen());
    expect(tester.takeException(), isNull);
    expect(find.byType(StoreHomeScreen), findsOneWidget);

    await pumpScreen(const ServicesHomeScreen());
    expect(tester.takeException(), isNull);
    expect(find.byType(ServicesHomeScreen), findsOneWidget);
  });
}
