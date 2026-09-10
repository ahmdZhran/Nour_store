import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_content_shell.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/core/widgets/directional_icon.dart';
import 'package:nour_store/features/services/presentation/models/services_dashboard_mock_data.dart';
import 'package:nour_store/features/services/presentation/widgets/category_provider_card_widget.dart';
import 'package:nour_store/features/services/presentation/widgets/category_subcategory_filter_bar.dart';

class CategoryProvidersScreen extends StatefulWidget {
  const CategoryProvidersScreen({
    super.key,
    required this.category,
  });

  final ServiceCategoryItem category;

  @override
  State<CategoryProvidersScreen> createState() =>
      _CategoryProvidersScreenState();
}

class _CategoryProvidersScreenState extends State<CategoryProvidersScreen> {
  static const double _gridGap = 12;
  static const double _childAspectRatio = 0.88;

  late List<CategorySubcategoryItem> _subcategories;
  late String _selectedSubcategoryId;

  @override
  void initState() {
    super.initState();
    _loadSubcategories();
  }

  @override
  void didUpdateWidget(covariant CategoryProvidersScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category.id != widget.category.id) {
      setState(_loadSubcategories);
    }
  }

  void _loadSubcategories() {
    _subcategories =
        ServicesDashboardMockData.subcategoriesFor(widget.category.id);
    _selectedSubcategoryId = _subcategories.first.id;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final providers = ServicesDashboardMockData.providersFor(
      categoryId: widget.category.id,
      subcategoryId: _selectedSubcategoryId,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _CategoryProvidersHeader(
              title: context.tr(widget.category.labelKey),
              textColor: textPrimary,
            ),
            Expanded(
              child: ResponsiveContentShell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CategorySubcategoryFilterBar(
                      subcategories: _subcategories,
                      selectedId: _selectedSubcategoryId,
                      onSelected: (id) {
                        setState(() => _selectedSubcategoryId = id);
                      },
                    ),
                    SizedBox(height: context.rh(16)),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.only(bottom: context.rh(24)),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: context.rh(_gridGap),
                          crossAxisSpacing: context.rw(_gridGap),
                          childAspectRatio: _childAspectRatio,
                        ),
                        itemCount: providers.length,
                        itemBuilder: (context, index) {
                          final craftsman = providers[index];
                          return CategoryProviderCardWidget(
                            key: ValueKey(
                              'category_provider_${craftsman.id}',
                            ),
                            craftsman: craftsman,
                            onViewProfile: () => Navigator.pushNamed(
                              context,
                              Routes.craftsmanProfile,
                              arguments: craftsman,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryProvidersHeader extends StatelessWidget {
  const _CategoryProvidersHeader({
    required this.title,
    required this.textColor,
  });

  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.rh(56),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const BackArrowIcon(
              color: ThemeColors.goldPrimary,
              size: 22,
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.sectionTitle.copyWith(
                color: textColor,
                fontSize: context.rsp(18),
              ),
            ),
          ),
          SizedBox(width: context.rw(48)),
        ],
      ),
    );
  }
}
