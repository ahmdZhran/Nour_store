import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';

class ServiceRequestSuccessWidget extends StatelessWidget {
  const ServiceRequestSuccessWidget({
    required this.onBackHome,
    super.key,
  });

  final VoidCallback onBackHome;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;
    final cardColor = isDark ? ThemeColors.darkCard : ThemeColors.lightCard;
    final borderColor =
        isDark ? ThemeColors.darkDivider : ThemeColors.lightCardBorder;
    final infoColor =
        isDark ? ThemeColors.darkSurface : ThemeColors.whiteColorF2;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(context.rr(16)),
        border: Border.all(color: borderColor),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          context.rw(16),
          context.rh(24),
          context.rw(16),
          context.rh(20),
        ),
        child: Column(
          children: [
            Container(
              width: context.rw(56),
              height: context.rw(56),
              decoration: const BoxDecoration(
                color: ThemeColors.backgrounGreen,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_rounded,
                color: ThemeColors.greenColorE7,
                size: context.rsp(28),
              ),
            ),
            SizedBox(height: context.rh(16)),
            Text(
              context.tr(AppStrings.serviceRequestSuccessTitle),
              textAlign: TextAlign.center,
              style: AppTextStyles.sectionTitle.copyWith(
                color: textPrimary,
                fontSize: context.rsp(18),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: context.rh(8)),
            Text(
              context.tr(AppStrings.serviceRequestSuccessBody),
              textAlign: TextAlign.center,
              style: AppTextStyles.servicesSearchHint.copyWith(
                color: textSecondary,
                fontSize: context.rsp(13),
                height: 1.5,
              ),
            ),
            SizedBox(height: context.rh(16)),
            DecoratedBox(
              decoration: BoxDecoration(
                color: infoColor,
                borderRadius: BorderRadius.circular(context.rr(12)),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.all(context.rw(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      context.tr(AppStrings.serviceRequestWhatNext),
                      textAlign: TextAlign.start,
                      style: AppTextStyles.servicesCraftsmanName.copyWith(
                        color: textPrimary,
                        fontSize: context.rsp(14),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: context.rh(12)),
                    _WhatNextStep(
                      number: '1',
                      text: context.tr(AppStrings.serviceRequestWhatNextStepOne),
                    ),
                    SizedBox(height: context.rh(10)),
                    _WhatNextStep(
                      number: '2',
                      text: context.tr(AppStrings.serviceRequestWhatNextStepTwo),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.rh(18)),
            SizedBox(
              height: context.rh(46),
              width: context.rw(200),
              child: FilledButton(
                onPressed: onBackHome,
                style: FilledButton.styleFrom(
                  backgroundColor: ThemeColors.goldPrimary,
                  foregroundColor: ThemeColors.blackColorF1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.rr(12)),
                  ),
                ),
                child: Text(
                  context.tr(AppStrings.serviceRequestBackHome),
                  style: AppTextStyles.servicesCraftsmanName.copyWith(
                    color: ThemeColors.blackColorF1,
                    fontSize: context.rsp(14),
                    fontWeight: FontWeight.w700,
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

class _WhatNextStep extends StatelessWidget {
  const _WhatNextStep({
    required this.number,
    required this.text,
  });

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: context.rw(22),
          height: context.rw(22),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isDark ? ThemeColors.darkCard : ThemeColors.greyColorF3,
            shape: BoxShape.circle,
          ),
          child: Text(
            number,
            style: AppTextStyles.servicesCraftsmanTitle.copyWith(
              color: textSecondary,
              fontSize: context.rsp(11),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(width: context.rw(8)),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.servicesSearchHint.copyWith(
              color: textSecondary,
              fontSize: context.rsp(12),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
