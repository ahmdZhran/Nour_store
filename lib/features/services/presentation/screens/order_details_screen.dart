import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_content_shell.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/core/widgets/directional_icon.dart';
import 'package:nour_store/features/services/presentation/models/services_orders_mock_data.dart';
import 'package:nour_store/features/services/presentation/widgets/order_appointment_picker_widget.dart';
import 'package:nour_store/features/services/presentation/widgets/order_price_adjustment_section.dart';
import 'package:nour_store/features/services/presentation/widgets/order_provider_summary_card.dart';
import 'package:nour_store/features/services/presentation/widgets/order_rejection_card.dart';
import 'package:nour_store/features/services/presentation/widgets/order_result_dialog.dart';
import 'package:nour_store/features/services/presentation/widgets/order_stage_timeline_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({
    super.key,
    required this.order,
  });

  final ServiceOrderItem order;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String? _selectedSlotId;

  @override
  void initState() {
    super.initState();
    if (widget.order.appointmentSlots.isNotEmpty) {
      _selectedSlotId = widget.order.appointmentSlots.last.id;
    }
  }

  bool get _showAppointmentPicker =>
      widget.order.status == OrderStatus.setInspection &&
      widget.order.appointmentSlots.isNotEmpty;

  bool get _showPriceAdjustment =>
      widget.order.status == OrderStatus.underInspection &&
      widget.order.hasPriceAdjustment;

  Future<void> _onApprovePrice() async {
    await showOrderResultDialog(
      context: context,
      isSuccess: true,
      titleKey: AppStrings.ordersPriceApprovedTitle,
      descriptionKey: AppStrings.ordersPriceApprovedDesc,
    );
  }

  Future<void> _onCancelOrder() async {
    await showOrderResultDialog(
      context: context,
      isSuccess: false,
      titleKey: AppStrings.ordersCancelledTitle,
      descriptionKey: AppStrings.ordersCancelledDesc,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;
    final stagesRadius = BorderRadius.circular(context.rr(12));

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _OrderDetailsHeader(
              title: context.tr(widget.order.titleKey),
              subtitle: context.tr(widget.order.dateKey),
              textPrimary: textPrimary,
              textSecondary: textSecondary,
            ),
            Expanded(
              child: ResponsiveContentShell(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: context.rh(24)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (widget.order.isRejected)
                        OrderRejectionCard(
                          reasonKey: widget.order.rejectionReasonKey!,
                        )
                      else
                        Material(
                          color: ThemeColors.darkSurface,
                          borderRadius: stagesRadius,
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: stagesRadius,
                              border: Border.all(
                                color: ThemeColors.lightBorder
                                    .withValues(alpha: 0.3),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.all(context.rw(12)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    context.tr(AppStrings.ordersProjectStages),
                                    style: AppTextStyles.servicesCraftsmanName
                                        .copyWith(
                                      color: textPrimary,
                                      fontSize: context.rsp(14),
                                    ),
                                  ),
                                  SizedBox(height: context.rh(12)),
                                  OrderStageTimelineWidget(
                                    stages: widget.order.stages,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (_showAppointmentPicker) ...[
                        SizedBox(height: context.rh(12)),
                        OrderAppointmentPickerWidget(
                          slots: widget.order.appointmentSlots,
                          selectedSlotId: _selectedSlotId,
                          onSlotSelected: (id) {
                            setState(() => _selectedSlotId = id);
                          },
                          onConfirm: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  context.tr(
                                    AppStrings.ordersAppointmentConfirmed,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                      if (_showPriceAdjustment) ...[
                        SizedBox(height: context.rh(12)),
                        OrderPriceAdjustmentSection(
                          newPriceKey: widget.order.newPriceKey!,
                          pricingReasonKey: widget.order.pricingReasonKey!,
                          onApprove: _onApprovePrice,
                          onCancel: _onCancelOrder,
                        ),
                      ],
                      SizedBox(height: context.rh(12)),
                      OrderProviderSummaryCard(
                        craftsman: widget.order.craftsman,
                        proposedCostKey: widget.order.proposedCostKey,
                        costLabelKey: widget.order.costLabelKey,
                        onViewProfile: () => Navigator.pushNamed(
                          context,
                          Routes.craftsmanProfile,
                          arguments: widget.order.craftsman,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderDetailsHeader extends StatelessWidget {
  const _OrderDetailsHeader({
    required this.title,
    required this.subtitle,
    required this.textPrimary,
    required this.textSecondary,
  });

  final String title;
  final String subtitle;
  final Color textPrimary;
  final Color textSecondary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.rh(64),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const BackArrowIcon(
              color: ThemeColors.goldPrimary,
              size: 22,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.sectionTitle.copyWith(
                    color: textPrimary,
                    fontSize: context.rsp(16),
                  ),
                ),
                SizedBox(height: context.rh(2)),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                    color: textSecondary,
                    fontSize: context.rsp(11),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: context.rw(48)),
        ],
      ),
    );
  }
}
