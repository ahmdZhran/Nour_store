import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_assets.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/service_request/presentation/widgets/service_request_field_widget.dart';

class ServiceRequestStepTwoWidget extends StatelessWidget {
  const ServiceRequestStepTwoWidget({
    required this.fullNameController,
    required this.emailController,
    required this.phoneController,
    required this.descriptionController,
    required this.budget,
    required this.startDate,
    required this.onEdit,
    super.key,
  });

  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController descriptionController;
  final String budget;
  final String startDate;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;
    final requiredMessage = context.tr(AppStrings.serviceRequestFieldRequired);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.tr(AppStrings.serviceRequestStepTwoOfTwo),
          textAlign: TextAlign.center,
          style: AppTextStyles.servicesCraftsmanTitle.copyWith(
            color: textSecondary,
            fontSize: context.rsp(13),
          ),
        ),
        SizedBox(height: context.rh(14)),
        Text(
          context.tr(AppStrings.serviceRequestConfirmTitle),
          textAlign: TextAlign.center,
          style: AppTextStyles.sectionTitle.copyWith(
            color: textPrimary,
            fontSize: context.rsp(20),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: context.rh(8)),
        Text(
          context.tr(AppStrings.serviceRequestConfirmBody),
          textAlign: TextAlign.center,
          style: AppTextStyles.servicesSearchHint.copyWith(
            color: textSecondary,
            fontSize: context.rsp(13),
            height: 1.5,
          ),
        ),
        SizedBox(height: context.rh(22)),
        ServiceRequestField(
          label: context.tr(AppStrings.fullName),
          hint: context.tr(AppStrings.fullNameHint),
          controller: fullNameController,
          isRequired: true,
          textInputAction: TextInputAction.next,
          validator: (value) => _required(value, requiredMessage),
        ),
        SizedBox(height: context.rh(16)),
        ServiceRequestField(
          label: context.tr(AppStrings.emailAddress),
          hint: context.tr(AppStrings.registerEmailHint),
          controller: emailController,
          isRequired: true,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          suffix: Icon(
            Icons.mail_outline_rounded,
            color: ThemeColors.goldPrimary,
            size: context.rsp(20),
          ),
          validator: (value) {
            final email = value?.trim() ?? '';
            if (email.isEmpty) return requiredMessage;
            if (!_isValidEmail(email)) {
              return context.tr(AppStrings.emailInvalid);
            }
            return null;
          },
        ),
        SizedBox(height: context.rh(16)),
        ServiceRequestField(
          label: context.tr(AppStrings.registerPhoneLabel),
          hint: context.tr(AppStrings.serviceRequestPhoneHint),
          controller: phoneController,
          isRequired: true,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          suffix: const _CountryPrefixChip(),
          validator: (value) => _required(value, requiredMessage),
        ),
        SizedBox(height: context.rh(16)),
        ServiceRequestField(
          label: context.tr(AppStrings.serviceRequestDescription),
          hint: context.tr(AppStrings.serviceRequestDescriptionHint),
          controller: descriptionController,
          isRequired: true,
          minLines: 4,
          maxLines: 5,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          validator: (value) => _required(value, requiredMessage),
        ),
        SizedBox(height: context.rh(16)),
        _ReviewCard(
          budget: budget,
          startDate: startDate,
          onEdit: onEdit,
        ),
      ],
    );
  }

  String? _required(String? value, String message) {
    if (value == null || value.trim().isEmpty) return message;
    return null;
  }

  bool _isValidEmail(String value) {
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value);
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({
    required this.budget,
    required this.startDate,
    required this.onEdit,
  });

  final String budget;
  final String startDate;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;
    final fillColor = isDark ? ThemeColors.darkCard : ThemeColors.lightCard;
    final borderColor =
        isDark ? ThemeColors.darkDivider : ThemeColors.lightCardBorder;
    final budgetLine = context
        .tr(AppStrings.serviceRequestBudgetSummary)
        .replaceAll('{budget}', budget);
    final dateLine = context
        .tr(AppStrings.serviceRequestStartDateSummary)
        .replaceAll('{date}', startDate);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(context.rr(16)),
        border: Border.all(color: borderColor),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.all(context.rw(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              context.tr(AppStrings.serviceRequestReviewTitle),
              style: AppTextStyles.servicesCraftsmanName.copyWith(
                color: textPrimary,
                fontSize: context.rsp(16),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: context.rh(12)),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr(AppStrings.serviceRequestRequestedCraftsman),
                        style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                          color: textSecondary,
                          fontSize: context.rsp(12),
                        ),
                      ),
                      SizedBox(height: context.rh(4)),
                      Text(
                        context.tr(AppStrings.servicesCraftsman1Name),
                        style: AppTextStyles.servicesCraftsmanName.copyWith(
                          color: textPrimary,
                          fontSize: context.rsp(15),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: context.rh(2)),
                      Text(
                        context.tr(AppStrings.serviceRequestCraftsmanTitle),
                        style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                          color: textSecondary,
                          fontSize: context.rsp(12),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: context.rw(12)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(context.rr(10)),
                  child: Image.asset(
                    AppAssets.servicesCraftsman1,
                    width: context.rw(64),
                    height: context.rw(64),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.rh(12)),
            Divider(height: 1, thickness: 1, color: borderColor),
            SizedBox(height: context.rh(8)),
            Row(
              children: [
                Text(
                  context.tr(AppStrings.serviceRequestProjectDetails),
                  style: AppTextStyles.servicesCraftsmanName.copyWith(
                    color: textPrimary,
                    fontSize: context.rsp(14),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: onEdit,
                  style: TextButton.styleFrom(
                    foregroundColor: ThemeColors.goldPrimary,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    context.tr(AppStrings.serviceRequestEdit),
                    style: AppTextStyles.servicesCraftsmanName.copyWith(
                      color: ThemeColors.goldPrimary,
                      fontSize: context.rsp(13),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.rh(8)),
            DecoratedBox(
              decoration: BoxDecoration(
                color: isDark ? ThemeColors.darkSurface : ThemeColors.whiteColor,
                borderRadius: BorderRadius.circular(context.rr(12)),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.rw(12),
                  vertical: context.rh(12),
                ),
                child: Text(
                  '${context.tr(AppStrings.serviceRequestAddressSummary)}\n$budgetLine\n$dateLine',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.servicesSearchHint.copyWith(
                    color: textSecondary,
                    fontSize: context.rsp(12),
                    height: 1.6,
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

class _CountryPrefixChip extends StatelessWidget {
  const _CountryPrefixChip();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;

    return Padding(
      padding: EdgeInsetsDirectional.only(end: context.rw(8)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: context.rw(18),
            height: context.rh(12),
            decoration: BoxDecoration(
              color: const Color(0xFF006C35),
              borderRadius: BorderRadius.circular(context.rr(2)),
            ),
          ),
          SizedBox(width: context.rw(6)),
          Text(
            'SA',
            style: AppTextStyles.servicesCraftsmanName.copyWith(
              color: textPrimary,
              fontSize: context.rsp(12),
            ),
          ),
          Icon(
            Icons.arrow_drop_down_rounded,
            color: isDark
                ? ThemeColors.darkTextSecondary
                : ThemeColors.lightTextSecondary,
            size: context.rsp(18),
          ),
        ],
      ),
    );
  }
}
