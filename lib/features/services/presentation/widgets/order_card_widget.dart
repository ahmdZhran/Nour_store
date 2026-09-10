import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/services/presentation/models/services_orders_mock_data.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({
    super.key,
    required this.order,
    this.onViewDetails,
  });

  final ServiceOrderItem order;
  final VoidCallback? onViewDetails;

  static const double _borderRadius = 12;
  static const double _avatarSize = 40;
  static const double _buttonHeight = 36;

  static const Color _setInspectionBadgeColor = Color(0xFFE85A8C);

  Color _badgeColorFor(OrderStatus status) {
    return switch (status) {
      OrderStatus.setInspection => _setInspectionBadgeColor,
      OrderStatus.underInspection => ThemeColors.blue0EA,
      OrderStatus.inProgress => ThemeColors.greenColor,
      OrderStatus.completed => ThemeColors.greenColorF8,
      OrderStatus.rejected => ThemeColors.redColorF9,
      OrderStatus.newOrder => ThemeColors.goldPrimary,
    };
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;
    final radius = BorderRadius.circular(context.rr(_borderRadius));
    final badgeColor = _badgeColorFor(order.status);

    return Material(
      color: ThemeColors.darkSurface,
      borderRadius: radius,
      clipBehavior: Clip.antiAlias,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: radius,
          border: Border.all(
            color: ThemeColors.lightBorder.withValues(alpha: 0.3),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.all(context.rw(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${context.tr(AppStrings.ordersOrderDatePrefix)} ${context.tr(order.dateKey)}',
                          style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                            color: textSecondary,
                            fontSize: context.rsp(11),
                          ),
                        ),
                        SizedBox(height: context.rh(2)),
                        Text(
                          '${context.tr(AppStrings.ordersOrderNumberPrefix)} ${order.orderNumber}',
                          style: AppTextStyles.servicesCraftsmanName.copyWith(
                            color: textPrimary,
                            fontSize: context.rsp(13),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: context.rw(8),
                      vertical: context.rh(4),
                    ),
                    decoration: BoxDecoration(
                      color: badgeColor.withValues(alpha: 0.16),
                      borderRadius: BorderRadius.circular(context.rr(8)),
                      border: Border.all(
                        color: badgeColor.withValues(alpha: 0.85),
                      ),
                    ),
                    child: Text(
                      context.tr(order.badgeKey),
                      style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                        color: badgeColor,
                        fontSize: context.rsp(10),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.rh(12)),
              Text(
                context.tr(order.titleKey),
                style: AppTextStyles.sectionTitle.copyWith(
                  color: textPrimary,
                  fontSize: context.rsp(16),
                ),
              ),
              SizedBox(height: context.rh(10)),
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      order.craftsman.photoAsset,
                      width: context.rw(_avatarSize),
                      height: context.rw(_avatarSize),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: context.rw(10)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr(order.craftsman.nameKey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.servicesCraftsmanName.copyWith(
                            color: textPrimary,
                            fontSize: context.rsp(13),
                          ),
                        ),
                        SizedBox(height: context.rh(2)),
                        Text(
                          context.tr(order.craftsman.titleKey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                            color: textSecondary,
                            fontSize: context.rsp(11),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.rh(12)),
              SizedBox(
                height: context.rh(_buttonHeight),
                width: double.infinity,
                child: FilledButton(
                  onPressed: onViewDetails,
                  style: FilledButton.styleFrom(
                    backgroundColor: ThemeColors.goldPrimary,
                    foregroundColor: ThemeColors.whiteColor,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.rr(8)),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    context.tr(AppStrings.ordersViewDetails),
                    style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                      color: ThemeColors.whiteColor,
                      fontSize: context.rsp(12),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
