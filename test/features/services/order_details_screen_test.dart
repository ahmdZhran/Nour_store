import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nour_store/core/languages/app_localization_setup.dart';
import 'package:nour_store/core/languages/lang_code.dart';
import 'package:nour_store/core/routes/app_router.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/features/services/presentation/models/services_orders_mock_data.dart';
import 'package:nour_store/features/services/presentation/screens/order_details_screen.dart';
import 'package:nour_store/features/services/presentation/widgets/order_appointment_picker_widget.dart';
import 'package:nour_store/features/services/presentation/widgets/order_price_adjustment_section.dart';
import 'package:nour_store/features/services/presentation/widgets/order_provider_summary_card.dart';
import 'package:nour_store/features/services/presentation/widgets/order_rejection_card.dart';
import 'package:nour_store/features/services/presentation/widgets/order_stage_timeline_widget.dart';

Future<void> pumpOrderDetailsScreen(
  WidgetTester tester,
  ServiceOrderItem order,
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
        home: OrderDetailsScreen(
          key: ValueKey(order.id),
          order: order,
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

  testWidgets('renders order details across statuses including under inspection',
      (tester) async {
    final newOrder =
        ServicesOrdersMockData.ordersFor(OrderStatus.newOrder).first;

    await pumpOrderDetailsScreen(tester, newOrder);

    expect(tester.takeException(), isNull);
    expect(find.text('تصميم وتركيب خزانة'), findsOneWidget);
    expect(find.text('مراحل المشروع'), findsOneWidget);
    expect(find.text('تم إرسال طلبك'), findsOneWidget);
    expect(find.byType(OrderStageTimelineWidget), findsOneWidget);
    expect(find.byType(OrderAppointmentPickerWidget), findsNothing);
    expect(find.byType(OrderPriceAdjustmentSection), findsNothing);
    expect(find.byType(OrderProviderSummaryCard), findsOneWidget);
    expect(find.text('عرض ملفه الشخصي'), findsOneWidget);

    final setInspectionOrder =
        ServicesOrdersMockData.ordersFor(OrderStatus.setInspection).first;

    await pumpOrderDetailsScreen(tester, setInspectionOrder);

    expect(find.text('قبول الطلب من الحرفي'), findsOneWidget);
    expect(find.byType(OrderAppointmentPickerWidget), findsOneWidget);
    expect(find.text('تأكيد الموعد'), findsOneWidget);
    expect(find.textContaining('السبت'), findsOneWidget);

    final underInspectionOrder =
        ServicesOrdersMockData.ordersFor(OrderStatus.underInspection).first;

    await pumpOrderDetailsScreen(tester, underInspectionOrder);

    expect(find.text('تمت المعاينة وتم تعديل السعر'), findsOneWidget);
    expect(find.byType(OrderPriceAdjustmentSection), findsOneWidget);
    expect(find.text('السعر الجديد'), findsOneWidget);
    expect(find.text('سبب التسعير'), findsOneWidget);
    expect(find.text('الموافقة على السعر'), findsOneWidget);
    expect(find.text('إلغاء الطلب'), findsOneWidget);

    await tester.ensureVisible(find.text('الموافقة على السعر'));
    await tester.tap(find.text('الموافقة على السعر'));
    await tester.pumpAndSettle();
    expect(find.textContaining('تم تأكيد السعر المعدل'), findsOneWidget);
    await tester.tap(find.text('حسناً'));
    await tester.pumpAndSettle();

    final completedOrder =
        ServicesOrdersMockData.ordersFor(OrderStatus.completed).first;

    await pumpOrderDetailsScreen(tester, completedOrder);

    expect(find.text('تم إنهاء العمل بنجاح'), findsAtLeastNWidgets(1));
    expect(find.text('تم الإستلام ودفع باقي المبلغ'), findsOneWidget);
    expect(find.text('التكلفة المتفق عليها'), findsOneWidget);
    expect(find.byType(OrderRejectionCard), findsNothing);

    final rejectedOrder =
        ServicesOrdersMockData.ordersFor(OrderStatus.rejected).first;

    await pumpOrderDetailsScreen(tester, rejectedOrder);

    expect(find.byType(OrderRejectionCard), findsOneWidget);
    expect(find.text('تم رفض الطلب'), findsOneWidget);
    expect(find.text('لا يوجد لدي وقت متاح'), findsOneWidget);
    expect(find.text('التكلفة المتفق عليها'), findsOneWidget);
  });

  test('order details route uses fade slide transition', () {
    final route = AppRouter.generateRoute(
      RouteSettings(
        name: Routes.orderDetails,
        arguments: ServicesOrdersMockData.orders.first,
      ),
    );

    expect(route, isA<PageRouteBuilder<dynamic>>());
  });
}
