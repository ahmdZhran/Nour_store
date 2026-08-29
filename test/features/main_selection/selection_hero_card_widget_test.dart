import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nour_store/core/languages/app_localization_setup.dart';
import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/core/utilies/app_assets.dart';
import 'package:nour_store/features/main_selection/presentation/widgets/selection_hero_card_widget.dart';

Future<void> pumpHeroCard(
  WidgetTester tester, {
  required VoidCallback onTap,
}) async {
  await ScreenUtil.ensureScreenSize();

  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp(
        locale: const Locale(LangCode.arabicCode),
        supportedLocales: AppLocalizationsSetup.supportedLocales,
        localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
        home: Scaffold(
          body: SelectionHeroCardWidget(
            backgroundAsset: AppAssets.gatewayStoreBg,
            overlayTitle: 'التسوق الإلكتروني',
            actionTitle: 'تسوق كل ما تحتاجه',
            actionSubtitle: 'اكتشف منتجاتنا',
            icon: Icons.shopping_cart_outlined,
            onTap: onTap,
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  tearDown(() async {
    await ScreenUtil.ensureScreenSize();
  });

  testWidgets('shows left-pointing chevron and handles tap in Arabic RTL layout',
      (tester) async {
    var tapped = false;

    await pumpHeroCard(tester, onTap: () => tapped = true);

    final icons = tester.widgetList<Icon>(find.byType(Icon)).toList();
    expect(icons.last.icon, Icons.chevron_left_rounded);

    await tester.tap(find.byType(SelectionHeroCardWidget));
    await tester.pumpAndSettle();

    expect(tapped, isTrue);
  });
}
