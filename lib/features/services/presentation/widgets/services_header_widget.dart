import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_assets.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';

class ServicesHeaderWidget extends StatelessWidget {
  const ServicesHeaderWidget({super.key});

  static const double _avatarSize = 40;
  

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;
    final avatarSize = context.rw(_avatarSize);
   

    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: context.rh(24),
        bottom: context.rh(16),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              AppAssets.servicesAvatar,
              width: avatarSize,
              height: avatarSize,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: context.rw(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr(AppStrings.servicesGreetingName),
                  style: AppTextStyles.servicesGreetingName.copyWith(
                    color: textPrimary,
                    fontSize: context.rsp(16),
                  ),
                ),
                Text(
                  context.tr(AppStrings.servicesGreeting),
                  style: AppTextStyles.servicesGreetingSubtitle.copyWith(
                    color: textSecondary,
                    fontSize: context.rsp(12),
                  ),
                ),
              ],
            ),
          ),
        
        ],
      ),
    );
  }
}