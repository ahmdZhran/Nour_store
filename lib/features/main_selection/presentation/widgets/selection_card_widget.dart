import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/core/widgets/directional_icon.dart';

class SelectionCardWidget extends StatelessWidget {
  const SelectionCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
    required this.isDark,
  });

  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;
  final bool isDark;

  static const double _borderRadius = 16;

  @override
  Widget build(BuildContext context) {
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;
    final borderColor =
        isDark ? ThemeColors.lightBorder : ThemeColors.lightCardBorder;
    final radius = BorderRadius.circular(_borderRadius.r);

    return Material(
      color: Colors.transparent,
      borderRadius: radius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        splashColor: ThemeColors.goldPrimary.withValues(alpha: 0.12),
        highlightColor: ThemeColors.goldPrimary.withValues(alpha: 0.06),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: radius,
            color: isDark ? ThemeColors.darkCard : ThemeColors.lightCard,
            border: Border.all(
              color: borderColor.withValues(alpha: isDark ? 0.6 : 0.8),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 16.w,
              end: 16.w,
              top: 16.h,
              bottom: 16.h,
            ),
            child: Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ThemeColors.goldPrimary.withValues(alpha: 0.12),
                  ),
                  child: Icon(
                    icon,
                    size: 24.sp,
                    color: ThemeColors.goldPrimary,
                  ),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.cardTitle.copyWith(
                          color: textPrimary,
                          fontSize: 17.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.cardDescription.copyWith(
                          color: textSecondary,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                ForwardChevronIcon(
                  size: 20.sp,
                  color: ThemeColors.goldPrimary.withValues(alpha: 0.7),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
