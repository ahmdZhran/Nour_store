import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nour_store/core/languages/app_localization_setup.dart';
import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/core/routes/app_router.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/features/services/presentation/models/craftsman_profile_mock_data.dart';
import 'package:nour_store/features/services/presentation/models/services_dashboard_mock_data.dart';
import 'package:nour_store/features/services/presentation/screens/craftsman_profile_screen.dart';
import 'package:nour_store/features/services/presentation/widgets/craftsman_portfolio_grid_widget.dart';
import 'package:nour_store/features/services/presentation/widgets/craftsman_profile_header_widget.dart';

void main() {
  tearDown(() async {
    await ScreenUtil.ensureScreenSize();
  });

  testWidgets('renders craftsman profile sections', (tester) async {
    final profile = CraftsmanProfileMockData.fromFeaturedCraftsman(
      ServicesDashboardMockData.featuredCraftsmen.first,
    );

    await ScreenUtil.ensureScreenSize();
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) => MaterialApp(
          locale: const Locale(LangCode.arabicCode),
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
          home: CraftsmanProfileScreen(profile: profile),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(CraftsmanProfileScreen), findsOneWidget);
    expect(find.byType(CraftsmanProfileHeaderWidget), findsOneWidget);
    expect(find.byType(CraftsmanPortfolioGridWidget), findsOneWidget);
    expect(find.byType(Hero), findsNWidgets(2));
    expect(find.text('عرض الأعمال'), findsOneWidget);
    expect(find.text('اطلب عرض سعر'), findsOneWidget);
  });

  test('craftsman profile route uses hero detail transition', () {
    final route = AppRouter.generateRoute(
      RouteSettings(
        name: Routes.craftsmanProfile,
        arguments: ServicesDashboardMockData.featuredCraftsmen.first,
      ),
    );

    expect(route, isA<PageRouteBuilder<dynamic>>());
  });
}
