import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';

class ServicesHomeScreen extends StatelessWidget {
  const ServicesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr(AppStrings.homeServices)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home_repair_service_outlined,
              size: 64.sp,
              color: ThemeColors.goldPrimary,
            ),
            SizedBox(height: 16.h),
            Text(
              context.tr(AppStrings.comingSoon),
              style: AppTextStyles.placeholderTitle.copyWith(
                color: textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
