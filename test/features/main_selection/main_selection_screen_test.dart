import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nour_store/core/languages/app_localization_setup.dart';
import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/features/main_selection/presentation/pages/main_selection_screen.dart';
import 'package:nour_store/features/main_selection/presentation/widgets/selection_card_widget.dart';

void main() {
  testWidgets('desktop web layout renders without overflow', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

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

    expect(tester.takeException(), isNull);
    expect(find.byType(MainSelectionScreen), findsOneWidget);
    expect(find.byType(SelectionCardWidget), findsNWidgets(2));
  });
}
