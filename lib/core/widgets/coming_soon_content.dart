import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';

class ComingSoonContent extends StatelessWidget {
  const ComingSoonContent({
    super.key,
    required this.icon,
  });

  final IconData icon;

  static const double _iconSize = 64;
  static const double _spacing = 16;
  static const double _titleFontSize = 22;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: context.rsp(_iconSize),
          color: ThemeColors.goldPrimary,
        ),
        SizedBox(height: context.rh(_spacing)),
        Text(
          context.tr(AppStrings.comingSoon),
          textAlign: TextAlign.center,
          style: AppTextStyles.placeholderTitle.copyWith(
            color: textSecondary,
            fontSize: context.rsp(_titleFontSize),
          ),
        ),
      ],
    );
  }
}
