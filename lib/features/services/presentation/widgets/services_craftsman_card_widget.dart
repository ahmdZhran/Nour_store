import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/services/presentation/models/services_dashboard_mock_data.dart';
import 'package:nour_store/features/services/presentation/utils/craftsman_profile_hero_tags.dart';

class ServicesCraftsmanCardWidget extends StatelessWidget {
  const ServicesCraftsmanCardWidget({
    super.key,
    required this.craftsman,
    this.onTap,
  });

  final FeaturedCraftsmanItem craftsman;
  final VoidCallback? onTap;

  static const double _width = 160;
  static const double _height = 220;
  static const double _imageHeight = 150;
  static const double _borderRadius = 12;

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
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        splashColor: ThemeColors.goldPrimary.withValues(alpha: 0.12),
        child: Ink(
          width: context.rw(_width),
          height: context.rh(_height),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: ThemeColors.lightBorder.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: context.rh(_imageHeight),
                child: Hero(
                  tag: CraftsmanProfileHeroTags.photo(craftsman.id),
                  child: Material(
                    color: Colors.transparent,
                    child: Image.asset(
                      craftsman.photoAsset,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.all(context.rw(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
