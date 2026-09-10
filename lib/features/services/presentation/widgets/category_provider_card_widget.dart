import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/services/presentation/models/services_dashboard_mock_data.dart';
import 'package:nour_store/features/services/presentation/utils/craftsman_profile_hero_tags.dart';

class CategoryProviderCardWidget extends StatelessWidget {
  const CategoryProviderCardWidget({
    super.key,
    required this.craftsman,
    this.onViewProfile,
  });

  final FeaturedCraftsmanItem craftsman;
  final VoidCallback? onViewProfile;

  static const double _borderRadius = 12;
  static const double _imageHeight = 100;
  static const double _buttonHeight = 28;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;
    final radius = BorderRadius.circular(context.rr(_borderRadius));

    return Align(
      alignment: Alignment.topCenter,
      child: Material(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                context.rw(8),
                context.rh(6),
                context.rw(8),
                context.rh(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.tr(craftsman.nameKey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.servicesCraftsmanName.copyWith(
                      color: textPrimary,
                      fontSize: context.rsp(12),
                      height: 1.1,
                    ),
                  ),
                  SizedBox(height: context.rh(2)),
                  Text(
                    context.tr(craftsman.titleKey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                      color: textSecondary,
                      fontSize: context.rsp(10),
                      height: 1.1,
                    ),
                  ),
                  SizedBox(height: context.rh(6)),
                  SizedBox(
                    height: context.rh(_buttonHeight),
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: onViewProfile,
                      style: FilledButton.styleFrom(
                        backgroundColor: ThemeColors.goldPrimary,
                        foregroundColor: ThemeColors.whiteColor,
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            context.rr(8),
                          ),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        context.tr(AppStrings.servicesViewProfile),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                          color: ThemeColors.whiteColor,
                          fontSize: context.rsp(10),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
