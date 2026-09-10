import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nour_store/core/languages/app_localization_setup.dart';
import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/core/routes/app_router.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/features/services/presentation/models/services_dashboard_mock_data.dart';
import 'package:nour_store/features/services/presentation/screens/category_providers_screen.dart';
import 'package:nour_store/features/services/presentation/widgets/category_provider_card_widget.dart';
import 'package:nour_store/features/services/presentation/widgets/category_subcategory_filter_bar.dart';

Future<void> pumpCategoryProvidersScreen(
  WidgetTester tester,
  ServiceCategoryItem category,
) async {
  await tester.binding.setSurfaceSize(const Size(390, 844));
  await ScreenUtil.ensureScreenSize();
  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp(
        locale: const Locale(LangCode.arabicCode),
        supportedLocales: AppLocalizationsSetup.supportedLocales,
        localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
        home: CategoryProvidersScreen(
          key: ValueKey(category.id),
          category: category,
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

  testWidgets('renders category providers with profession-specific filters',
      (tester) async {
    final carpentry = ServicesDashboardMockData.categories
        .firstWhere((item) => item.id == 'carpentry');

    await pumpCategoryProvidersScreen(tester, carpentry);

    expect(tester.takeException(), isNull);
    expect(find.byType(CategoryProvidersScreen), findsOneWidget);
    expect(find.text('نجارة وأثاث'), findsOneWidget);
    expect(find.byType(CategorySubcategoryFilterBar), findsOneWidget);
    expect(find.text('الكل'), findsOneWidget);
    expect(find.text('أثاث'), findsOneWidget);
    expect(find.text('مكتب'), findsOneWidget);
    expect(find.text('تركيب'), findsOneWidget);
    expect(find.text('تصليح'), findsOneWidget);
    expect(find.byType(CategoryProviderCardWidget), findsAtLeastNWidgets(2));
    expect(find.text('عرض الملف الشخصي'), findsAtLeastNWidgets(1));

    final advertising = ServicesDashboardMockData.categories
        .firstWhere((item) => item.id == 'advertising');

    await pumpCategoryProvidersScreen(tester, advertising);

    expect(find.text('دعاية وإعلان'), findsOneWidget);
    expect(find.text('الكل'), findsOneWidget);
    expect(find.text('تصميم'), findsOneWidget);
    expect(find.text('طباعة'), findsOneWidget);
    expect(find.text('سوشيال ميديا'), findsOneWidget);
    expect(find.text('أثاث'), findsNothing);
  });

  test('category providers route uses fade slide transition', () {
    final route = AppRouter.generateRoute(
      RouteSettings(
        name: Routes.categoryProviders,
        arguments: ServicesDashboardMockData.categories.first,
      ),
    );

    expect(route, isA<PageRouteBuilder<dynamic>>());
  });
}
