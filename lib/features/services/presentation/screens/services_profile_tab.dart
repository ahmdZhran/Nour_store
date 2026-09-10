import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_content_shell.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/services/presentation/widgets/profile_menu_section.dart';
import 'package:nour_store/features/services/presentation/widgets/profile_menu_tile.dart';

class ServicesProfileTab extends StatelessWidget {
  const ServicesProfileTab({super.key});

  Future<void> _confirmLogout(BuildContext context) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final isDark = Theme.of(dialogContext).brightness == Brightness.dark;
        final textPrimary = isDark
            ? ThemeColors.darkTextPrimary
            : ThemeColors.lightTextPrimary;
        final textSecondary = isDark
            ? ThemeColors.darkTextSecondary
            : ThemeColors.lightTextSecondary;

        return AlertDialog(
          backgroundColor: ThemeColors.darkSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dialogContext.rr(16)),
          ),
          title: Text(
            dialogContext.tr(AppStrings.logOutConfirmTitle),
            style: AppTextStyles.servicesCraftsmanName.copyWith(
              color: textPrimary,
              fontSize: dialogContext.rsp(16),
            ),
          ),
          content: Text(
            dialogContext.tr(AppStrings.logOutConfirmBody),
            style: AppTextStyles.servicesCraftsmanTitle.copyWith(
              color: textSecondary,
              fontSize: dialogContext.rsp(13),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(
                dialogContext.tr(AppStrings.cancel),
                style: const TextStyle(color: ThemeColors.goldPrimary),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(
                dialogContext.tr(AppStrings.logOut),
                style: const TextStyle(color: ThemeColors.redColorF9),
              ),
            ),
          ],
        );
      },
    );

    if (shouldLogout == true && context.mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.login,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;

    return ResponsiveContentShell(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: context.rh(88)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              context.tr(AppStrings.servicesNavProfile),
              style: AppTextStyles.sectionTitle.copyWith(
                color: textPrimary,
                fontSize: context.rsp(20),
              ),
            ),
            SizedBox(height: context.rh(20)),
            ProfileMenuSection(
              titleKey: AppStrings.profilePersonalSettings,
              items: [
                ProfileMenuTile(
                  key: const ValueKey('profile_personal_data'),
                  icon: Icons.person_outline_rounded,
                  labelKey: AppStrings.profilePersonalData,
                  onTap: () => Navigator.pushNamed(
                    context,
                    Routes.personalData,
                  ),
                ),
                ProfileMenuTile(
                  key: const ValueKey('profile_change_password'),
                  icon: Icons.lock_outline_rounded,
                  labelKey: AppStrings.profileChangePassword,
                  onTap: () => Navigator.pushNamed(
                    context,
                    Routes.changePassword,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.rh(20)),
            ProfileMenuSection(
              titleKey: AppStrings.profileGeneral,
              items: [
                ProfileMenuTile(
                  key: const ValueKey('profile_our_services'),
                  icon: Icons.home_repair_service_outlined,
                  labelKey: AppStrings.profileOurServices,
                  onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.mainSelection,
                    (route) => false,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.rh(28)),
            SizedBox(
              height: context.rh(44),
              child: OutlinedButton(
                onPressed: () => _confirmLogout(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: ThemeColors.redColorF9,
                  side: const BorderSide(color: ThemeColors.redColorF9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.rr(10)),
                  ),
                ),
                child: Text(
                  context.tr(AppStrings.logOut),
                  style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                    color: ThemeColors.redColorF9,
                    fontSize: context.rsp(14),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
