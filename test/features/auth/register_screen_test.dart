import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nour_store/core/languages/app_localization_setup.dart';
import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/core/routes/app_router.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/features/sign_up/presentation/screens/sign_up_screen.dart';

void main() {
  tearDown(() async {
    await ScreenUtil.ensureScreenSize();
  });

  testWidgets('renders register form fields and create account button',
      (tester) async {
    await ScreenUtil.ensureScreenSize();
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) => MaterialApp(
          locale: const Locale(LangCode.arabicCode),
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
          home: const RegisterScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(RegisterScreen), findsOneWidget);
    expect(find.text('أهلا بك'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(5));
    expect(find.textContaining('الاسم بالكامل'), findsWidgets);
    expect(find.textContaining('رقم الهاتف المحمول'), findsOneWidget);
    expect(find.text('إنشاء حساب'), findsOneWidget);
    expect(find.textContaining('لديك حساب؟'), findsOneWidget);
    expect(find.textContaining('تسجيل دخول'), findsOneWidget);
  });

  test('register route uses fade slide up transition', () {
    final route = AppRouter.generateRoute(
      const RouteSettings(name: Routes.register),
    );

    expect(route, isA<PageRouteBuilder<dynamic>>());
  });
}
