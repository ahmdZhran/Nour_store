import 'package:flutter/material.dart';
import 'package:nour_store/core/utilies/app_assets.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/features/services/presentation/models/services_dashboard_mock_data.dart';

enum OrderStatus {
  newOrder,
  setInspection,
  underInspection,
  inProgress,
  completed,
  rejected,
}

class OrderStatusFilterItem {
  const OrderStatusFilterItem({
    required this.status,
    required this.labelKey,
  });

  final OrderStatus status;
  final String labelKey;

  String get id => status.name;
}

class OrderStageItem {
  const OrderStageItem({
    required this.titleKey,
    required this.descriptionKey,
    required this.dateKey,
    required this.icon,
    required this.iconColor,
    this.isActive = false,
  });

  final String titleKey;
  final String descriptionKey;
  final String dateKey;
  final IconData icon;
  final Color iconColor;
  final bool isActive;
}

class AppointmentSlotItem {
  const AppointmentSlotItem({
    required this.id,
    required this.dayKey,
    required this.timeKey,
  });

  final String id;
  final String dayKey;
  final String timeKey;
}

class ServiceOrderItem {
  const ServiceOrderItem({
    required this.id,
    required this.status,
    required this.orderNumber,
    required this.titleKey,
    required this.dateKey,
    required this.badgeKey,
    required this.craftsman,
    required this.proposedCostKey,
    required this.stages,
    this.appointmentSlots = const [],
    this.newPriceKey,
    this.pricingReasonKey,
    this.rejectionReasonKey,
    this.costLabelKey = AppStrings.ordersProposedCost,
  });

  final String id;
  final OrderStatus status;
  final String orderNumber;
  final String titleKey;
  final String dateKey;
  final String badgeKey;
  final FeaturedCraftsmanItem craftsman;
  final String proposedCostKey;
  final List<OrderStageItem> stages;
  final List<AppointmentSlotItem> appointmentSlots;
  final String? newPriceKey;
  final String? pricingReasonKey;
  final String? rejectionReasonKey;
  final String costLabelKey;

  bool get hasPriceAdjustment =>
      newPriceKey != null && pricingReasonKey != null;

  bool get isRejected =>
      status == OrderStatus.rejected && rejectionReasonKey != null;
}

class ServicesOrdersMockData {
  ServicesOrdersMockData._();

  static const statusFilters = [
    OrderStatusFilterItem(
      status: OrderStatus.newOrder,
      labelKey: AppStrings.ordersFilterNew,
    ),
    OrderStatusFilterItem(
      status: OrderStatus.setInspection,
      labelKey: AppStrings.ordersFilterSetInspection,
    ),
    OrderStatusFilterItem(
      status: OrderStatus.underInspection,
      labelKey: AppStrings.ordersFilterUnderInspection,
    ),
    OrderStatusFilterItem(
      status: OrderStatus.inProgress,
      labelKey: AppStrings.ordersFilterInProgress,
    ),
    OrderStatusFilterItem(
      status: OrderStatus.completed,
      labelKey: AppStrings.ordersFilterCompleted,
    ),
    OrderStatusFilterItem(
      status: OrderStatus.rejected,
      labelKey: AppStrings.ordersFilterRejected,
    ),
  ];

  static const _sampleCraftsman = FeaturedCraftsmanItem(
    id: 'order_craftsman_ali',
    nameKey: AppStrings.ordersSampleCraftsmanName,
    titleKey: AppStrings.ordersSampleCraftsmanTitle,
    photoAsset: AppAssets.servicesCraftsman2,
  );

  static const _appointmentSlots = [
    AppointmentSlotItem(
      id: 'slot_1',
      dayKey: AppStrings.ordersSlot1Day,
      timeKey: AppStrings.ordersSlot1Time,
    ),
    AppointmentSlotItem(
      id: 'slot_2',
      dayKey: AppStrings.ordersSlot2Day,
      timeKey: AppStrings.ordersSlot2Time,
    ),
    AppointmentSlotItem(
      id: 'slot_3',
      dayKey: AppStrings.ordersSlot3Day,
      timeKey: AppStrings.ordersSlot3Time,
    ),
  ];

  static const _sentStage = OrderStageItem(
    titleKey: AppStrings.ordersStageSentTitle,
    descriptionKey: AppStrings.ordersStageSentDesc,
    dateKey: AppStrings.ordersSampleDate,
    icon: Icons.mark_email_read_outlined,
    iconColor: Color(0xFF7D52B5),
  );

  static const _acceptedStage = OrderStageItem(
    titleKey: AppStrings.ordersStageAcceptedTitle,
    descriptionKey: AppStrings.ordersStageAcceptedDesc,
    dateKey: AppStrings.ordersSampleDate,
    icon: Icons.check_rounded,
    iconColor: Color(0xFF10B981),
    isActive: true,
  );

  static const _priceAdjustedStage = OrderStageItem(
    titleKey: AppStrings.ordersStagePriceAdjustedTitle,
    descriptionKey: AppStrings.ordersStagePriceAdjustedDesc,
    dateKey: AppStrings.ordersSampleDate,
    icon: Icons.payments_outlined,
    iconColor: Color(0xFFE85A8C),
    isActive: true,
  );

  static const _inProgressStage = OrderStageItem(
    titleKey: AppStrings.ordersStageInProgressTitle,
    descriptionKey: AppStrings.ordersStageInProgressDesc,
    dateKey: AppStrings.ordersSampleDate,
    icon: Icons.handyman_outlined,
    iconColor: Color(0xFFD4A843),
    isActive: true,
  );

  static const _completedStage = OrderStageItem(
    titleKey: AppStrings.ordersStageCompletedTitle,
    descriptionKey: AppStrings.ordersStageCompletedDesc,
    dateKey: AppStrings.ordersSampleDate,
    icon: Icons.check_rounded,
    iconColor: Color(0xFF10B981),
    isActive: true,
  );

  static const _paidStage = OrderStageItem(
    titleKey: AppStrings.ordersStagePaidTitle,
    descriptionKey: AppStrings.ordersStagePaidDesc,
    dateKey: AppStrings.ordersSampleDate,
    icon: Icons.payments_outlined,
    iconColor: Color(0xFFD4A843),
    isActive: true,
  );

  static const orders = [
    ServiceOrderItem(
      id: 'order_new_1',
      status: OrderStatus.newOrder,
      orderNumber: '82545',
      titleKey: AppStrings.ordersSampleTitle,
      dateKey: AppStrings.ordersSampleDate,
      badgeKey: AppStrings.ordersBadgeNew,
      craftsman: _sampleCraftsman,
      proposedCostKey: AppStrings.ordersSampleCost,
      stages: [_sentStage],
    ),
    ServiceOrderItem(
      id: 'order_set_inspection_1',
      status: OrderStatus.setInspection,
      orderNumber: '82546',
      titleKey: AppStrings.ordersSampleTitle,
      dateKey: AppStrings.ordersSampleDate,
      badgeKey: AppStrings.ordersBadgeSetInspection,
      craftsman: _sampleCraftsman,
      proposedCostKey: AppStrings.ordersSampleCost,
      stages: [
        _sentStage,
        _acceptedStage,
      ],
      appointmentSlots: _appointmentSlots,
    ),
    ServiceOrderItem(
      id: 'order_under_inspection_1',
      status: OrderStatus.underInspection,
      orderNumber: '82547',
      titleKey: AppStrings.ordersSampleTitle,
      dateKey: AppStrings.ordersSampleDate,
      badgeKey: AppStrings.ordersBadgeUnderInspection,
      craftsman: FeaturedCraftsmanItem(
        id: 'order_craftsman_ahmed',
        nameKey: AppStrings.servicesCraftsman1Name,
        titleKey: AppStrings.ordersSampleCraftsmanTitle,
        photoAsset: AppAssets.servicesCraftsman1,
      ),
      proposedCostKey: AppStrings.ordersSampleCost,
      newPriceKey: AppStrings.ordersSampleNewCost,
      pricingReasonKey: AppStrings.ordersSamplePricingReason,
      stages: [
        _sentStage,
        OrderStageItem(
          titleKey: AppStrings.ordersStageAcceptedTitle,
          descriptionKey: AppStrings.ordersStageAcceptedDesc,
          dateKey: AppStrings.ordersSampleDate,
          icon: Icons.check_rounded,
          iconColor: Color(0xFF10B981),
        ),
        _priceAdjustedStage,
      ],
    ),
    ServiceOrderItem(
      id: 'order_in_progress_1',
      status: OrderStatus.inProgress,
      orderNumber: '82548',
      titleKey: AppStrings.ordersSampleTitle,
      dateKey: AppStrings.ordersSampleDate,
      badgeKey: AppStrings.ordersBadgeInProgress,
      craftsman: FeaturedCraftsmanItem(
        id: 'order_craftsman_omar',
        nameKey: AppStrings.servicesCraftsman3Name,
        titleKey: AppStrings.ordersSampleCraftsmanTitle,
        photoAsset: AppAssets.servicesCraftsman3,
      ),
      proposedCostKey: AppStrings.ordersSampleCost,
      stages: [
        _sentStage,
        OrderStageItem(
          titleKey: AppStrings.ordersStageAcceptedTitle,
          descriptionKey: AppStrings.ordersStageAcceptedDesc,
          dateKey: AppStrings.ordersSampleDate,
          icon: Icons.check_rounded,
          iconColor: Color(0xFF10B981),
        ),
        OrderStageItem(
          titleKey: AppStrings.ordersStageInspectionTitle,
          descriptionKey: AppStrings.ordersStageInspectionDesc,
          dateKey: AppStrings.ordersSampleDate,
          icon: Icons.visibility_outlined,
          iconColor: Color(0xFFD4A843),
        ),
        _inProgressStage,
      ],
    ),
    ServiceOrderItem(
      id: 'order_completed_1',
      status: OrderStatus.completed,
      orderNumber: '82545',
      titleKey: AppStrings.ordersSampleTitle,
      dateKey: AppStrings.ordersSampleDate,
      badgeKey: AppStrings.ordersBadgeCompleted,
      craftsman: FeaturedCraftsmanItem(
        id: 'order_craftsman_ahmed_completed',
        nameKey: AppStrings.servicesCraftsman1Name,
        titleKey: AppStrings.ordersSampleCraftsmanTitle,
        photoAsset: AppAssets.servicesCraftsman1,
      ),
      proposedCostKey: AppStrings.ordersSampleCost,
      costLabelKey: AppStrings.ordersAgreedCost,
      stages: [
        _sentStage,
        OrderStageItem(
          titleKey: AppStrings.ordersStageAcceptedTitle,
          descriptionKey: AppStrings.ordersStageAcceptedDesc,
          dateKey: AppStrings.ordersSampleDate,
          icon: Icons.check_rounded,
          iconColor: Color(0xFF10B981),
        ),
        OrderStageItem(
          titleKey: AppStrings.ordersStagePriceAdjustedTitle,
          descriptionKey: AppStrings.ordersStagePriceAdjustedDesc,
          dateKey: AppStrings.ordersSampleDate,
          icon: Icons.payments_outlined,
          iconColor: Color(0xFFE85A8C),
        ),
        _completedStage,
        _paidStage,
      ],
    ),
    ServiceOrderItem(
      id: 'order_rejected_1',
      status: OrderStatus.rejected,
      orderNumber: '82545',
      titleKey: AppStrings.ordersSampleTitle,
      dateKey: AppStrings.ordersSampleDate,
      badgeKey: AppStrings.ordersBadgeRejected,
      craftsman: FeaturedCraftsmanItem(
        id: 'order_craftsman_ahmed_rejected',
        nameKey: AppStrings.servicesCraftsman1Name,
        titleKey: AppStrings.ordersSampleCraftsmanTitle,
        photoAsset: AppAssets.servicesCraftsman1,
      ),
      proposedCostKey: AppStrings.ordersSampleCost,
      costLabelKey: AppStrings.ordersAgreedCost,
      rejectionReasonKey: AppStrings.ordersSampleRejectionReason,
      stages: const [],
    ),
  ];

  static List<ServiceOrderItem> ordersFor(OrderStatus status) {
    return orders
        .where((order) => order.status == status)
        .toList(growable: false);
  }
}
