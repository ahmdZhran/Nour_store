import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/services/presentation/models/services_dashboard_mock_data.dart';

class CategorySubcategoryFilterBar extends StatelessWidget {
  const CategorySubcategoryFilterBar({
    super.key,
    required this.subcategories,
    required this.selectedId,
    required this.onSelected,
  });

  final List<CategorySubcategoryItem> subcategories;
  final String selectedId;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final inactiveColor =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;

    return SizedBox(
      height: context.rh(40),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: subcategories.length,
        separatorBuilder: (_, _) => SizedBox(width: context.rw(16)),
        itemBuilder: (context, index) {
          final item = subcategories[index];
          final isSelected = item.id == selectedId;

          return GestureDetector(
            onTap: () => onSelected(item.id),
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  context.tr(item.labelKey),
                  style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                    color: isSelected ? ThemeColors.goldPrimary : inactiveColor,
                    fontSize: context.rsp(14),
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
                SizedBox(height: context.rh(6)),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  height: 2,
                  width: context.rw(isSelected ? 28 : 0),
                  decoration: BoxDecoration(
                    color: ThemeColors.goldPrimary,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
