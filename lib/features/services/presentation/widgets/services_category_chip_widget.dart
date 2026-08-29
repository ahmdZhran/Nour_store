import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/services/presentation/models/services_dashboard_mock_data.dart';

class ServicesCategoryChipWidget extends StatelessWidget {
  const ServicesCategoryChipWidget({
    super.key,
    required this.category,
    this.onTap,
  });

  final ServiceCategoryItem category;
  final VoidCallback? onTap;

  static const double _width = 90;
  static const double _height = 95;
  static const double _borderRadius = 12;
  static const double _iconContainerSize = 40;

  @override
  Widget build(BuildContext context) {
    final iconContainerSize = context.rw(_iconContainerSize);
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: iconContainerSize,
                height: iconContainerSize,
                decoration: const BoxDecoration(
                  color: ThemeColors.darkCard,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  category.icon,
                  size: context.rsp(22),
                  color: ThemeColors.goldPrimary,
                ),
              ),
              SizedBox(height: context.rh(8)),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.rw(4),
                ),
                child: Text(
                  context.tr(category.labelKey),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.servicesCategoryLabel.copyWith(
                    color: ThemeColors.goldPrimary,
                    fontSize: context.rsp(12),
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
