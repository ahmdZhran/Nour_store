import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nour_store/core/languages/app_localization_setup.dart';
import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/features/main_selection/presentation/screens/main_selection_screen.dart';
import 'package:nour_store/features/main_selection/presentation/widgets/selection_hero_card_widget.dart';

Future<void> pumpMainSelectionScreen(
  WidgetTester tester,
  Size surfaceSize,
) async {
  await tester.binding.setSurfaceSize(surfaceSize);
  await ScreenUtil.ensureScreenSize();

  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        locale: const Locale(LangCode.arabicCode),
        supportedLocales: AppLocalizationsSetup.supportedLocales,
        localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
        home: const MainSelectionScreen(),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  tearDown(() async {
    await ScreenUtil.ensureScreenSize();
  });

  testWidgets('desktop and mobile layouts render without overflow', (tester) async {
    await pumpMainSelectionScreen(tester, const Size(1200, 800));

    expect(tester.takeException(), isNull);
    expect(find.byType(MainSelectionScreen), findsOneWidget);
    expect(find.byType(SelectionHeroCardWidget), findsNWidgets(3));

    await pumpMainSelectionScreen(tester, const Size(390, 844));

    expect(tester.takeException(), isNull);
    expect(find.byType(SelectionHeroCardWidget), findsNWidgets(3));
  });
}
