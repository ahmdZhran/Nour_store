import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_content_shell.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/services/presentation/models/services_dashboard_mock_data.dart';
import 'package:nour_store/features/services/presentation/widgets/services_category_chip_widget.dart';
import 'package:nour_store/features/services/presentation/widgets/services_craftsman_card_widget.dart';
import 'package:nour_store/features/services/presentation/widgets/services_header_widget.dart';
import 'package:nour_store/features/services/presentation/widgets/services_hero_banner_widget.dart';
import 'package:nour_store/features/services/presentation/widgets/services_search_bar_widget.dart';

class ServicesDashboardTab extends StatelessWidget {
  const ServicesDashboardTab({super.key});

  static const double _sectionGap = 32;
  static const double _chipGap = 16;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;

    return ResponsiveContentShell(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: context.rh(100)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ServicesHeaderWidget(),
            const ServicesSearchBarWidget(),
            SizedBox(height: context.rh(24)),
            ServicesHeroBannerWidget(
              banners: ServicesDashboardMockData.heroBanners,
            ),
            SizedBox(height: context.rh(_sectionGap)),
            Text(
              context.tr(AppStrings.servicesCategoriesTitle),
              style: AppTextStyles.sectionTitle.copyWith(
                color: textPrimary,
                fontSize: context.rsp(20),
              ),
            ),
            SizedBox(height: context.rh(16)),
            SizedBox(
              height: context.rh(95),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: ServicesDashboardMockData.categories.length,
                separatorBuilder: (_, _) => SizedBox(width: context.rw(_chipGap)),
                itemBuilder: (context, index) {
                  return ServicesCategoryChipWidget(
                    category: ServicesDashboardMockData.categories[index],
                    onTap: () {},
                  );
                },
              ),
            ),
            SizedBox(height: context.rh(_sectionGap)),
            Text(
              context.tr(AppStrings.servicesFeaturedCraftsmenTitle),
              style: AppTextStyles.sectionTitle.copyWith(
                color: textPrimary,
                fontSize: context.rsp(20),
              ),
            ),
            SizedBox(height: context.rh(16)),
            SizedBox(
              height: context.rh(220),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: ServicesDashboardMockData.featuredCraftsmen.length,
                separatorBuilder: (_, _) => SizedBox(width: context.rw(_chipGap)),
                itemBuilder: (context, index) {
                  return ServicesCraftsmanCardWidget(
                    craftsman:
                        ServicesDashboardMockData.featuredCraftsmen[index],
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.craftsmanProfile,
                      arguments:
                          ServicesDashboardMockData.featuredCraftsmen[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
