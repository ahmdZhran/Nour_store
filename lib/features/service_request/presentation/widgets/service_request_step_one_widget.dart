import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/service_request/presentation/widgets/service_request_attachment_widget.dart';
import 'package:nour_store/features/service_request/presentation/widgets/service_request_field_widget.dart';

class ServiceRequestStepOneWidget extends StatelessWidget {
  const ServiceRequestStepOneWidget({
    required this.projectTitleController,
    required this.descriptionController,
    required this.budgetController,
    required this.startDateController,
    required this.onPickStartDate,
    super.key,
  });

  final TextEditingController projectTitleController;
  final TextEditingController descriptionController;
  final TextEditingController budgetController;
  final TextEditingController startDateController;
  final VoidCallback onPickStartDate;

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
          context.tr(AppStrings.serviceRequestStepOneOfTwo),
          textAlign: TextAlign.center,
          style: AppTextStyles.servicesCraftsmanTitle.copyWith(
            color: textSecondary,
            fontSize: context.rsp(13),
          ),
        ),
        SizedBox(height: context.rh(14)),
        Text(
          context.tr(AppStrings.serviceRequestTellUs),
          textAlign: TextAlign.center,
          style: AppTextStyles.sectionTitle.copyWith(
            color: textPrimary,
            fontSize: context.rsp(20),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: context.rh(8)),
        Text(
          context.tr(AppStrings.serviceRequestDetailsHint),
          textAlign: TextAlign.center,
          style: AppTextStyles.servicesSearchHint.copyWith(
            color: textSecondary,
            fontSize: context.rsp(13),
            height: 1.5,
          ),
        ),
        SizedBox(height: context.rh(22)),
        ServiceRequestField(
          label: context.tr(AppStrings.serviceRequestProjectTitle),
          hint: context.tr(AppStrings.serviceRequestProjectTitleHint),
          controller: projectTitleController,
          isRequired: true,
          textInputAction: TextInputAction.next,
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
        ServiceRequestField(
          label: context.tr(AppStrings.serviceRequestBudget),
          hint: context.tr(AppStrings.serviceRequestBudgetHint),
          controller: budgetController,
          isRequired: true,
          textInputAction: TextInputAction.next,
          validator: (value) => _required(value, requiredMessage),
        ),
        SizedBox(height: context.rh(16)),
        ServiceRequestField(
          label: context.tr(AppStrings.serviceRequestStartDate),
          hint: context.tr(AppStrings.serviceRequestStartDateHint),
          controller: startDateController,
          isRequired: true,
          readOnly: true,
          onTap: onPickStartDate,
          suffix: Icon(
            Icons.calendar_today_outlined,
            color: textSecondary,
            size: context.rsp(18),
          ),
          validator: (value) => _required(value, requiredMessage),
        ),
        SizedBox(height: context.rh(16)),
        const ServiceRequestAttachmentWidget(),
      ],
    );
  }

  String? _required(String? value, String message) {
    if (value == null || value.trim().isEmpty) return message;
    return null;
  }
}
