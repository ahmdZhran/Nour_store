import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';

class ServicesFloatingNavBar extends StatelessWidget {
  const ServicesFloatingNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  static const double _height = 64;
  static const double _borderRadius = 28;

  static const _items = [
    _NavItemData(
      labelKey: AppStrings.servicesNavHome,
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
    ),
    _NavItemData(
      labelKey: AppStrings.servicesNavCategories,
      icon: Icons.grid_view_rounded,
      activeIcon: Icons.grid_view_rounded,
    ),
    _NavItemData(
      labelKey: AppStrings.servicesNavOrders,
      icon: Icons.assignment_outlined,
      activeIcon: Icons.assignment_rounded,
    ),
    _NavItemData(
      labelKey: AppStrings.servicesNavProfile,
      icon: Icons.person_outline,
      activeIcon: Icons.person_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: context.rw(16),
        end: context.rw(16),
        bottom: context.rh(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(context.rr(_borderRadius)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: ThemeColors.darkSurface.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(context.rr(_borderRadius)),
              border: Border.all(
                color: ThemeColors.goldPrimary.withValues(alpha: 0.4),
              ),
              boxShadow: [
                BoxShadow(
                  color: ThemeColors.goldPrimary.withValues(alpha: 0.15),
                  blurRadius: 32,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: SizedBox(
              height: context.rh(_height),
              child: Row(
                children: List.generate(_items.length, (index) {
                  return Expanded(
                    child: _NavBarItem(
                      key: ValueKey('services_nav_$index'),
                      data: _items[index],
                      isSelected: selectedIndex == index,
                      onTap: () => onItemSelected(index),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  const _NavItemData({
    required this.labelKey,
    required this.icon,
    required this.activeIcon,
  });

  final String labelKey;
  final IconData icon;
  final IconData activeIcon;
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    super.key,
    required this.data,
    required this.isSelected,
    required this.onTap,
  });

  final _NavItemData data;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? ThemeColors.goldPrimary
        : ThemeColors.darkTextSecondary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: context.rw(isSelected ? 12 : 0),
                vertical: context.rh(4),
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? ThemeColors.goldPrimary.withValues(alpha: 0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(context.rr(16)),
              ),
              child: Icon(
                isSelected ? data.activeIcon : data.icon,
                size: context.rsp(22),
                color: color,
              ),
            ),
            SizedBox(height: context.rh(2)),
            Text(
              context.tr(data.labelKey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.servicesNavLabel.copyWith(
                color: color,
                fontSize: context.rsp(12),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
