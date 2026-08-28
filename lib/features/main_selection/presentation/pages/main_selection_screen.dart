import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_content_shell.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
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
        child: ResponsiveContentShell(
          expandVertically: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: context.rh(48)),
              Text(
                context.tr(AppStrings.mainSelectionTitle),
                textAlign: TextAlign.center,
                style: AppTextStyles.titleLarge.copyWith(
                  color: textPrimary,
                  fontSize: context.rsp(28),
                ),
              ),
              SizedBox(height: context.rh(12)),
              Text(
                context.tr(AppStrings.mainSelectionSubtitle),
                textAlign: TextAlign.center,
                style: AppTextStyles.subtitleMedium.copyWith(
                  color: textSecondary,
                  fontSize: context.rsp(16),
                ),
              ),
              SizedBox(height: context.rh(32)),
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
              SizedBox(height: context.rh(12)),
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
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
