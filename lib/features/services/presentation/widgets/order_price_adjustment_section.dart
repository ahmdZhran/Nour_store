import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';

class OrderPriceAdjustmentSection extends StatelessWidget {
  const OrderPriceAdjustmentSection({
    super.key,
    required this.newPriceKey,
    required this.pricingReasonKey,
    required this.onApprove,
    required this.onCancel,
  });

  final String newPriceKey;
  final String pricingReasonKey;
  final VoidCallback onApprove;
  final VoidCallback onCancel;

  static const double _borderRadius = 12;
  static const double _buttonHeight = 44;
  static const Color _infoCardBg = Color(0xFF1F2A22);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _InfoCard(
          labelKey: AppStrings.ordersNewPrice,
          valueKey: newPriceKey,
          textPrimary: textPrimary,
        ),
        SizedBox(height: context.rh(8)),
        _InfoCard(
          labelKey: AppStrings.ordersPricingReason,
          valueKey: pricingReasonKey,
          textPrimary: textPrimary,
        ),
        SizedBox(height: context.rh(12)),
        SizedBox(
          height: context.rh(_buttonHeight),
          child: FilledButton.icon(
            onPressed: onApprove,
            style: FilledButton.styleFrom(
              backgroundColor: ThemeColors.greenColor,
              foregroundColor: ThemeColors.whiteColor,
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.rr(10)),
              ),
              elevation: 0,
            ),
            icon: Icon(Icons.check_rounded, size: context.rsp(18)),
            label: Text(
              context.tr(AppStrings.ordersApprovePrice),
              style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                color: ThemeColors.whiteColor,
                fontSize: context.rsp(13),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(height: context.rh(8)),
        SizedBox(
          height: context.rh(_buttonHeight),
          child: FilledButton.icon(
            onPressed: onCancel,
            style: FilledButton.styleFrom(
              backgroundColor: ThemeColors.redColorF9,
              foregroundColor: ThemeColors.whiteColor,
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.rr(10)),
              ),
              elevation: 0,
            ),
            icon: Icon(Icons.close_rounded, size: context.rsp(18)),
            label: Text(
              context.tr(AppStrings.ordersCancelOrder),
              style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                color: ThemeColors.whiteColor,
                fontSize: context.rsp(13),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.labelKey,
    required this.valueKey,
    required this.textPrimary,
  });

  final String labelKey;
  final String valueKey;
  final Color textPrimary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.all(context.rw(12)),
      decoration: BoxDecoration(
        color: OrderPriceAdjustmentSection._infoCardBg,
        borderRadius: BorderRadius.circular(
          context.rr(OrderPriceAdjustmentSection._borderRadius),
        ),
        border: Border.all(
          color: ThemeColors.greenColor.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(labelKey),
            style: AppTextStyles.servicesCraftsmanName.copyWith(
              color: textPrimary,
              fontSize: context.rsp(13),
            ),
          ),
          SizedBox(height: context.rh(6)),
          Text(
            context.tr(valueKey),
            style: AppTextStyles.servicesCraftsmanName.copyWith(
              color: ThemeColors.goldPrimary,
              fontSize: context.rsp(15),
            ),
          ),
        ],
      ),
    );
  }
}
