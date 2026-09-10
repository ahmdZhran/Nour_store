import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_content_shell.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/services/presentation/models/services_dashboard_mock_data.dart';
import 'package:nour_store/features/services/presentation/widgets/services_category_grid_card.dart';

class ServicesCategoriesTab extends StatelessWidget {
  const ServicesCategoriesTab({super.key});

  static const double _gridGap = 12;
  static const double _childAspectRatio = 1.15;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final categories = ServicesDashboardMockData.categories;

    return ResponsiveContentShell(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: context.rh(16)),
              child: Text(
                context.tr(AppStrings.servicesNavCategories),
                style: AppTextStyles.sectionTitle.copyWith(
                  color: textPrimary,
                  fontSize: context.rsp(20),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: context.rh(88)),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: context.rh(_gridGap),
                crossAxisSpacing: context.rw(_gridGap),
                childAspectRatio: _childAspectRatio,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final category = categories[index];
                  return ServicesCategoryGridCard(
                    key: ValueKey('category_grid_${category.id}'),
                    category: category,
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.categoryProviders,
                      arguments: category,
                    ),
                  );
                },
                childCount: categories.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
