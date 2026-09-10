import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';

class ProfileAvatarUpload extends StatelessWidget {
  const ProfileAvatarUpload({
    super.key,
    this.onUploadTap,
  });

  final VoidCallback? onUploadTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.rw(96),
          height: context.rw(96),
          decoration: const BoxDecoration(
            color: ThemeColors.darkCard,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.person_outline_rounded,
            size: context.rsp(48),
            color: ThemeColors.goldPrimary,
          ),
        ),
        SizedBox(height: context.rh(12)),
        Material(
          color: ThemeColors.goldPrimary.withValues(alpha: 0.16),
          borderRadius: BorderRadius.circular(context.rr(10)),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onUploadTap,
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: context.rw(14),
                vertical: context.rh(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    size: context.rsp(16),
                    color: ThemeColors.goldPrimary,
                  ),
                  SizedBox(width: context.rw(6)),
                  Text(
                    context.tr(AppStrings.profileUploadPhoto),
                    style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                      color: ThemeColors.goldPrimary,
                      fontSize: context.rsp(12),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
