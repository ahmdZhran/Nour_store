import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/services/presentation/models/services_dashboard_mock_data.dart';

class OrderProviderSummaryCard extends StatelessWidget {
  const OrderProviderSummaryCard({
    super.key,
    required this.craftsman,
    required this.proposedCostKey,
    this.costLabelKey = AppStrings.ordersProposedCost,
    this.onViewProfile,
  });

  final FeaturedCraftsmanItem craftsman;
  final String proposedCostKey;
  final String costLabelKey;
  final VoidCallback? onViewProfile;

  static const double _borderRadius = 12;
  static const double _avatarSize = 48;
  static const double _buttonHeight = 36;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;
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
          padding: EdgeInsetsDirectional.all(context.rw(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.tr(AppStrings.ordersServiceProvider),
                style: AppTextStyles.servicesCraftsmanName.copyWith(
                  color: textPrimary,
                  fontSize: context.rsp(14),
                ),
              ),
              SizedBox(height: context.rh(12)),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(context.rr(8)),
                    child: Image.asset(
                      craftsman.photoAsset,
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
                          context.tr(craftsman.nameKey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.servicesCraftsmanName.copyWith(
                            color: textPrimary,
                            fontSize: context.rsp(14),
                          ),
                        ),
                        SizedBox(height: context.rh(2)),
                        Text(
                          context.tr(craftsman.titleKey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                            color: textSecondary,
                            fontSize: context.rsp(12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.rh(12)),
              Divider(
                height: 1,
                color: ThemeColors.lightBorder.withValues(alpha: 0.25),
              ),
              SizedBox(height: context.rh(12)),
              Text(
                context.tr(AppStrings.ordersAgreementSummary),
                style: AppTextStyles.servicesCraftsmanName.copyWith(
                  color: textPrimary,
                  fontSize: context.rsp(14),
                ),
              ),
              SizedBox(height: context.rh(8)),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      context.tr(costLabelKey),
                      style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                        color: textSecondary,
                        fontSize: context.rsp(12),
                      ),
                    ),
                  ),
                  Text(
                    context.tr(proposedCostKey),
                    style: AppTextStyles.servicesCraftsmanName.copyWith(
                      color: ThemeColors.goldPrimary,
                      fontSize: context.rsp(14),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.rh(12)),
              SizedBox(
                height: context.rh(_buttonHeight),
                child: OutlinedButton.icon(
                  onPressed: onViewProfile,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: ThemeColors.goldPrimary,
                    side: const BorderSide(color: ThemeColors.goldPrimary),
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.rr(8)),
                    ),
                  ),
                  icon: Icon(
                    Icons.person_outline,
                    size: context.rsp(16),
                    color: ThemeColors.goldPrimary,
                  ),
                  label: Text(
                    context.tr(AppStrings.ordersViewHisProfile),
                    style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                      color: ThemeColors.goldPrimary,
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
