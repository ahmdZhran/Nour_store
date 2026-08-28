import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/main_selection/presentation/widgets/selection_card_widget.dart';

class MainSelectionScreen extends StatelessWidget {
  const MainSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 48.h),
                  Text(
                    context.tr(AppStrings.mainSelectionTitle),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.titleLarge.copyWith(color: textPrimary),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    context.tr(AppStrings.mainSelectionSubtitle),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subtitleMedium.copyWith(
                      color: textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SelectionCardWidget(
                    title: context.tr(AppStrings.onlineStore),
                    description: context.tr(AppStrings.onlineStoreDesc),
                    icon: Icons.shopping_bag_outlined,
                    isDark: isDark,
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.storeHome,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SelectionCardWidget(
                    title: context.tr(AppStrings.homeServices),
                    description: context.tr(AppStrings.homeServicesDesc),
                    icon: Icons.home_repair_service_outlined,
                    isDark: isDark,
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.servicesHome,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
