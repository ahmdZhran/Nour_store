import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/services/presentation/widgets/profile_menu_tile.dart';

class ProfileMenuSection extends StatelessWidget {
  const ProfileMenuSection({
    super.key,
    required this.titleKey,
    required this.items,
  });

  final String titleKey;
  final List<ProfileMenuTile> items;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.tr(titleKey),
          style: AppTextStyles.servicesCraftsmanTitle.copyWith(
            color: textSecondary,
            fontSize: context.rsp(13),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.rh(10)),
        for (var i = 0; i < items.length; i++) ...[
          items[i],
          if (i < items.length - 1) SizedBox(height: context.rh(8)),
        ],
      ],
    );
  }
}
