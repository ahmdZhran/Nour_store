import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/services/presentation/models/craftsman_profile_mock_data.dart';
import 'package:nour_store/features/services/presentation/utils/craftsman_profile_hero_tags.dart';

class CraftsmanProfileHeaderWidget extends StatelessWidget {
  const CraftsmanProfileHeaderWidget({
    super.key,
    required this.profile,
  });

  final CraftsmanProfileData profile;

  static const double _avatarSize = 80;
  static const double _avatarRadius = 14;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;
    final avatarSize = context.rw(_avatarSize);
    final radius = BorderRadius.circular(context.rr(_avatarRadius));

    return Container(
      padding: EdgeInsetsDirectional.all(context.rw(16)),
      decoration: BoxDecoration(
        color: ThemeColors.darkCard,
        borderRadius: BorderRadius.circular(context.rr(16)),
        border: Border.all(
          color: ThemeColors.lightBorder.withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: CraftsmanProfileHeroTags.photo(profile.id),
            child: Material(
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: radius,
                child: Image.asset(
                  profile.photoAsset,
                  width: avatarSize,
                  height: avatarSize,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: context.rw(16)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.tr(profile.nameKey),
                        style: AppTextStyles.servicesCraftsmanName.copyWith(
                          color: textPrimary,
                          fontSize: context.rsp(20),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: context.rw(12),
                        vertical: context.rh(4),
                      ),
                      decoration: BoxDecoration(
                        color: ThemeColors.goldPrimary,
                        borderRadius: BorderRadius.circular(context.rr(20)),
                      ),
                      child: Text(
                        context.tr(profile.specialtyKey),
                        style: AppTextStyles.servicesCategoryLabel.copyWith(
                          color: ThemeColors.blackColorF1,
                          fontWeight: FontWeight.w700,
                          fontSize: context.rsp(12),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.rh(8)),
                _MetaRow(
                  icon: Icons.location_on_outlined,
                  label: context.tr(profile.locationKey),
                  color: textSecondary,
                ),
                SizedBox(height: context.rh(4)),
                _MetaRow(
                  icon: Icons.calendar_month_outlined,
                  label: context.tr(profile.memberSinceKey),
                  color: textSecondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: context.rsp(16), color: color),
        SizedBox(width: context.rw(4)),
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.servicesCraftsmanTitle.copyWith(
              color: color,
              fontSize: context.rsp(13),
            ),
          ),
        ),
      ],
    );
  }
}
