import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';

class OrderRejectionCard extends StatelessWidget {
  const OrderRejectionCard({
    super.key,
    required this.reasonKey,
  });

  final String reasonKey;

  static const double _borderRadius = 12;
  static const Color _reasonBg = Color(0xFF2A1719);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final radius = BorderRadius.circular(context.rr(_borderRadius));

    return Material(
      color: ThemeColors.darkSurface,
      borderRadius: radius,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: radius,
          border: Border.all(
            color: ThemeColors.lightBorder.withValues(alpha: 0.3),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.all(context.rw(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.tr(AppStrings.ordersProjectStages),
                style: AppTextStyles.servicesCraftsmanName.copyWith(
                  color: textPrimary,
                  fontSize: context.rsp(14),
                ),
              ),
              SizedBox(height: context.rh(20)),
              Center(
                child: Container(
                  width: context.rw(64),
                  height: context.rw(64),
                  decoration: BoxDecoration(
                    color: ThemeColors.redColorF9.withValues(alpha: 0.16),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.gpp_bad_outlined,
                    color: ThemeColors.redColorF9,
                    size: context.rsp(30),
                  ),
                ),
              ),
              SizedBox(height: context.rh(14)),
              Text(
                context.tr(AppStrings.ordersRejectedTitle),
                textAlign: TextAlign.center,
                style: AppTextStyles.servicesCraftsmanName.copyWith(
                  color: textPrimary,
                  fontSize: context.rsp(16),
                ),
              ),
              SizedBox(height: context.rh(14)),
              Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.all(context.rw(12)),
                decoration: BoxDecoration(
                  color: _reasonBg,
                  borderRadius: BorderRadius.circular(context.rr(10)),
                  border: Border.all(
                    color: ThemeColors.redColorF9.withValues(alpha: 0.35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(AppStrings.ordersRejectionReasonLabel),
                      style: AppTextStyles.servicesCraftsmanName.copyWith(
                        color: ThemeColors.redColorF9,
                        fontSize: context.rsp(13),
                      ),
                    ),
                    SizedBox(height: context.rh(6)),
                    Text(
                      context.tr(reasonKey),
                      style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                        color: ThemeColors.redColorF9.withValues(alpha: 0.85),
                        fontSize: context.rsp(12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
