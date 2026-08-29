import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_content_shell.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_assets.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/main_selection/presentation/widgets/selection_hero_card_widget.dart';

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
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: context.rh(24)),
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
                SizedBox(height: context.rh(8)),
                Text(
                  context.tr(AppStrings.mainSelectionSubtitle),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subtitleMedium.copyWith(
                    color: textSecondary,
                    fontSize: context.rsp(16),
                  ),
                ),
                SizedBox(height: context.rh(32)),
                SelectionHeroCardWidget(
                  backgroundAsset: AppAssets.gatewayStoreBg,
                  overlayTitle: context.tr(AppStrings.onlineStore),
                  actionTitle: context.tr(AppStrings.onlineStoreAction),
                  actionSubtitle: context.tr(AppStrings.onlineStoreActionDesc),
                  icon: Icons.shopping_cart_outlined,
                  onTap: () => Navigator.pushNamed(
                    context,
                    Routes.storeHome,
                  ),
                ),
                SizedBox(height: context.rh(16)),
                SelectionHeroCardWidget(
                  backgroundAsset: AppAssets.gatewayServicesBg,
                  overlayTitle: context.tr(AppStrings.homeServices),
                  actionTitle: context.tr(AppStrings.homeServicesAction),
                  actionSubtitle:
                      context.tr(AppStrings.homeServicesActionDesc),
                  icon: Icons.build_outlined,
                  onTap: () => Navigator.pushNamed(
                    context,
                    Routes.servicesHome,
                  ),
                ),
                SizedBox(height: context.rh(16)),
                SelectionHeroCardWidget(
                  backgroundAsset: AppAssets.gatewayMarketplaceBg,
                  overlayTitle:
                      context.tr(AppStrings.usedProductsRealEstate),
                  actionTitle: context.tr(AppStrings.marketplaceAction),
                  actionSubtitle:
                      context.tr(AppStrings.marketplaceActionDesc),
                  icon: Icons.domain_outlined,
                  onTap: () => Navigator.pushNamed(
                    context,
                    Routes.marketplaceHome,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
