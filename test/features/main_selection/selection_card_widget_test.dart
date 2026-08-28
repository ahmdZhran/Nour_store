import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nour_store/core/languages/app_localization_setup.dart';
import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/features/main_selection/presentation/widgets/selection_card_widget.dart';

void main() {
  testWidgets('shows left-pointing chevron in Arabic RTL layout', (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) => MaterialApp(
          locale: const Locale(LangCode.arabicCode),
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
          home: Scaffold(
            body: SelectionCardWidget(
              title: 'المتجر الإلكتروني',
              description: 'تسوق من مجموعة متنوعة من المنتجات',
              icon: Icons.shopping_bag_outlined,
              isDark: true,
              onTap: () {},
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final icons = tester.widgetList<Icon>(find.byType(Icon)).toList();
    final chevron = icons.last;

    expect(chevron.icon, Icons.chevron_left_rounded);
  });
}
