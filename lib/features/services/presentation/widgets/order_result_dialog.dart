import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';

Future<void> showOrderResultDialog({
  required BuildContext context,
  required bool isSuccess,
  required String titleKey,
  required String descriptionKey,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (dialogContext) {
      final isDark = Theme.of(dialogContext).brightness == Brightness.dark;
      final textPrimary = isDark
          ? ThemeColors.darkTextPrimary
          : ThemeColors.lightTextPrimary;
      final textSecondary = isDark
          ? ThemeColors.darkTextSecondary
          : ThemeColors.lightTextSecondary;
      final accent =
          isSuccess ? ThemeColors.greenColor : ThemeColors.redColorF9;

      return Dialog(
        backgroundColor: ThemeColors.darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dialogContext.rr(16)),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.all(dialogContext.rw(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: dialogContext.rw(56),
                height: dialogContext.rw(56),
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.18),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isSuccess ? Icons.check_rounded : Icons.close_rounded,
                  color: accent,
                  size: dialogContext.rsp(28),
                ),
              ),
              SizedBox(height: dialogContext.rh(16)),
              Text(
                dialogContext.tr(titleKey),
                textAlign: TextAlign.center,
                style: AppTextStyles.servicesCraftsmanName.copyWith(
                  color: textPrimary,
                  fontSize: dialogContext.rsp(16),
                ),
              ),
              SizedBox(height: dialogContext.rh(8)),
              Text(
                dialogContext.tr(descriptionKey),
                textAlign: TextAlign.center,
                style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                  color: textSecondary,
                  fontSize: dialogContext.rsp(13),
                  height: 1.4,
                ),
              ),
              SizedBox(height: dialogContext.rh(18)),
              SizedBox(
                width: double.infinity,
                height: dialogContext.rh(40),
                child: FilledButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  style: FilledButton.styleFrom(
                    backgroundColor: accent,
                    foregroundColor: ThemeColors.whiteColor,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(dialogContext.rr(10)),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    dialogContext.tr(AppStrings.ordersDialogOk),
                    style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                      color: ThemeColors.whiteColor,
                      fontSize: dialogContext.rsp(13),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
