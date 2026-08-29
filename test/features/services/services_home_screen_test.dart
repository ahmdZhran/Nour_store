import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nour_store/core/languages/app_localization_setup.dart';
import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/core/widgets/coming_soon_content.dart';
import 'package:nour_store/features/services/presentation/screens/services_home_screen.dart';
import 'package:nour_store/features/services/presentation/widgets/services_category_chip_widget.dart';
import 'package:nour_store/features/services/presentation/widgets/services_craftsman_card_widget.dart';
import 'package:nour_store/features/services/presentation/widgets/services_dashboard_tab.dart';
import 'package:nour_store/features/services/presentation/widgets/services_floating_nav_bar.dart';
import 'package:nour_store/features/services/presentation/widgets/services_hero_banner_widget.dart';
import 'package:nour_store/features/services/presentation/widgets/services_search_bar_widget.dart';

Future<void> pumpServicesHomeScreen(
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
        home: const ServicesHomeScreen(),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  tearDown(() async {
    await ScreenUtil.ensureScreenSize();
  });

  testWidgets('renders dashboard, supports desktop, and switches nav tabs',
      (tester) async {
    await pumpServicesHomeScreen(tester, const Size(390, 844));

    expect(tester.takeException(), isNull);
    expect(find.byType(ServicesDashboardTab), findsOneWidget);
    expect(find.byType(ServicesSearchBarWidget), findsOneWidget);
    expect(find.byType(ServicesHeroBannerWidget), findsOneWidget);
    expect(find.byType(ServicesCategoryChipWidget), findsAtLeastNWidgets(4));
    expect(find.byType(ServicesCraftsmanCardWidget), findsAtLeastNWidgets(2));
    expect(find.byType(ServicesFloatingNavBar), findsOneWidget);
    expect(find.text('ابحث عما تريد...'), findsOneWidget);

    await pumpServicesHomeScreen(tester, const Size(1200, 800));

    expect(tester.takeException(), isNull);
    expect(find.byType(ServicesHomeScreen), findsOneWidget);

    await pumpServicesHomeScreen(tester, const Size(390, 844));

    await tester.tap(find.byKey(const ValueKey('services_nav_1')));
    await tester.pumpAndSettle();

    expect(find.byType(ComingSoonContent), findsOneWidget);
    expect(find.byType(ServicesDashboardTab), findsNothing);
  });
}
