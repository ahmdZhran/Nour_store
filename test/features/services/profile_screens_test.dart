import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nour_store/core/languages/app_localization_setup.dart';
import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/core/routes/app_router.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/features/services/presentation/screens/change_password_screen.dart';
import 'package:nour_store/features/services/presentation/screens/personal_data_screen.dart';
import 'package:nour_store/features/services/presentation/widgets/profile_avatar_upload.dart';

Future<void> pumpScreen(WidgetTester tester, Widget home) async {
  await tester.binding.setSurfaceSize(const Size(390, 844));
  await ScreenUtil.ensureScreenSize();
  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp(
        locale: const Locale(LangCode.arabicCode),
        supportedLocales: AppLocalizationsSetup.supportedLocales,
        localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
        home: home,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  tearDown(() async {
    await ScreenUtil.ensureScreenSize();
  });

  testWidgets('renders personal data and change password screens',
      (tester) async {
    await pumpScreen(tester, const PersonalDataScreen());

    expect(tester.takeException(), isNull);
    expect(find.text('البيانات الشخصية'), findsOneWidget);
    expect(find.byType(ProfileAvatarUpload), findsOneWidget);
    expect(find.text('رفع صورة'), findsOneWidget);
    expect(find.text('حفظ التغييرات'), findsOneWidget);
    expect(find.text('الاسم بالكامل'), findsOneWidget);

    await pumpScreen(tester, const ChangePasswordScreen());

    expect(find.text('تغيير كلمة المرور'), findsOneWidget);
    expect(find.text('كلمة المرور الحالية'), findsOneWidget);
    expect(find.text('كلمة المرور الجديدة'), findsOneWidget);
    expect(find.text('تأكيد كلمة المرور'), findsNWidgets(2));
  });

  test('personal data and change password routes use fade slide transition', () {
    expect(
      AppRouter.generateRoute(const RouteSettings(name: Routes.personalData)),
      isA<PageRouteBuilder<dynamic>>(),
    );
    expect(
      AppRouter.generateRoute(const RouteSettings(name: Routes.changePassword)),
      isA<PageRouteBuilder<dynamic>>(),
    );
  });
}
