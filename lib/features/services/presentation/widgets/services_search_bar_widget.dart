import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';

class ServicesSearchBarWidget extends StatelessWidget {
  const ServicesSearchBarWidget({super.key});

  static const double _height = 48;
  static const double _borderRadius = 14;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hintColor =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;

    return Container(
      height: context.rh(_height),
      decoration: BoxDecoration(
        color: ThemeColors.darkSurface,
        borderRadius: BorderRadius.circular(context.rr(_borderRadius)),
        border: Border.all(
          color: ThemeColors.lightBorder.withValues(alpha: 0.4),
        ),
      ),
      padding: EdgeInsetsDirectional.only(
        start: context.rw(16),
        end: context.rw(16),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: context.rsp(22),
            color: hintColor,
          ),
          SizedBox(width: context.rw(12)),
          Expanded(
            child: Text(
              context.tr(AppStrings.servicesSearchHint),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.servicesSearchHint.copyWith(
                color: hintColor,
                fontSize: context.rsp(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
