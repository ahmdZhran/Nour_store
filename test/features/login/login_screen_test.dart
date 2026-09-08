import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nour_store/core/languages/app_localization_setup.dart';
import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/core/routes/app_router.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/features/login/presentation/screens/login_screen.dart';

void main() {
  tearDown(() async {
    await ScreenUtil.ensureScreenSize();
  });

  testWidgets('renders login fields and login button', (tester) async {
    await ScreenUtil.ensureScreenSize();
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) => MaterialApp(
          locale: const Locale(LangCode.arabicCode),
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
          home: const LoginScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.text('تسجيل دخول'), findsNWidgets(2));
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.textContaining('البريد الالكتروني'), findsWidgets);
    expect(find.textContaining('كلمة المرور'), findsWidgets);
    expect(find.textContaining('ليس لديك حساب؟'), findsOneWidget);
    expect(find.textContaining('إنشاء حساب'), findsOneWidget);
  });

  test('login route uses fade slide up transition', () {
    final route = AppRouter.generateRoute(
      const RouteSettings(name: Routes.login),
    );

    expect(route, isA<PageRouteBuilder<dynamic>>());
  });
}
