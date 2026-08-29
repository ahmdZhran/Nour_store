import 'package:flutter/material.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
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
  static const double _iconContainerSize = 48;
  static const double _iconSize = 24;
  static const double _chevronSize = 20;
  static const double _contentPadding = 16;
  static const double _iconGap = 14;
  static const double _titleDescriptionGap = 4;
  static const double _titleFontSize = 17;
  static const double _descriptionFontSize = 13;

  @override
  Widget build(BuildContext context) {
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;
    final borderColor =
        isDark ? ThemeColors.lightBorder : ThemeColors.lightCardBorder;
    final radius = BorderRadius.circular(context.rr(_borderRadius));
    final iconContainerSize = context.rw(_iconContainerSize);

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
              start: context.rw(_contentPadding),
              end: context.rw(_contentPadding),
              top: context.rh(_contentPadding),
              bottom: context.rh(_contentPadding),
            ),
            child: Row(
              children: [
                Container(
                  width: iconContainerSize,
                  height: iconContainerSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ThemeColors.goldPrimary.withValues(alpha: 0.12),
                  ),
                  child: Icon(
                    icon,
                    size: context.rsp(_iconSize),
                    color: ThemeColors.goldPrimary,
                  ),
                ),
                SizedBox(width: context.rw(_iconGap)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.cardTitle.copyWith(
                          color: textPrimary,
                          fontSize: context.rsp(_titleFontSize),
                        ),
                      ),
                      SizedBox(height: context.rh(_titleDescriptionGap)),
                      Text(
                        description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.cardDescription.copyWith(
                          color: textSecondary,
                          fontSize: context.rsp(_descriptionFontSize),
                        ),
                      ),
                    ],
                  ),
                ),
                ForwardChevronIcon(
                  size: context.rsp(_chevronSize),
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
