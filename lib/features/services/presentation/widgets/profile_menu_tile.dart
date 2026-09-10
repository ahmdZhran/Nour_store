import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/core/widgets/directional_icon.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.labelKey,
    this.onTap,
  });

  final IconData icon;
  final String labelKey;
  final VoidCallback? onTap;

  static const double _borderRadius = 12;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
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
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: ThemeColors.lightBorder.withValues(alpha: 0.3),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: context.rw(12),
              vertical: context.rh(14),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: ThemeColors.goldPrimary,
                  size: context.rsp(22),
                ),
                SizedBox(width: context.rw(12)),
                Expanded(
                  child: Text(
                    context.tr(labelKey),
                    style: AppTextStyles.servicesCraftsmanName.copyWith(
                      color: textPrimary,
                      fontSize: context.rsp(14),
                    ),
                  ),
                ),
                ForwardChevronIcon(
                  color: ThemeColors.goldPrimary,
                  size: context.rsp(20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
