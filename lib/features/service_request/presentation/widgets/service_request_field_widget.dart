import 'package:flutter/material.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';

class ServiceRequestField extends StatelessWidget {
  const ServiceRequestField({
    required this.label,
    required this.hint,
    required this.controller,
    this.isRequired = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.onTap,
    this.suffix,
    this.validator,
    super.key,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isRequired;
  final int minLines;
  final int maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffix;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final hintColor =
        isDark ? ThemeColors.darkTextHint : ThemeColors.lightTextHint;
    final fillColor = isDark ? ThemeColors.darkCard : ThemeColors.lightCard;
    final borderColor =
        isDark ? ThemeColors.darkDivider : ThemeColors.lightCardBorder;
    final radius = BorderRadius.circular(context.rr(12));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ServiceRequestFieldLabel(label: label, isRequired: isRequired),
        SizedBox(height: context.rh(8)),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textAlign: TextAlign.center,
          minLines: minLines,
          maxLines: maxLines,
          readOnly: readOnly,
          onTap: onTap,
          validator: validator,
          style: AppTextStyles.servicesCraftsmanName.copyWith(
            color: textPrimary,
            fontSize: context.rsp(14),
            height: 1.3,
          ),
          cursorColor: ThemeColors.goldPrimary,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.servicesSearchHint.copyWith(
              color: hintColor,
              fontSize: context.rsp(14),
            ),
            filled: true,
            fillColor: fillColor,
            contentPadding: EdgeInsetsDirectional.symmetric(
              horizontal: context.rw(14),
              vertical: context.rh(14),
            ),
            suffixIcon: suffix,
            suffixIconConstraints: BoxConstraints(
              minWidth: context.rw(40),
              minHeight: context.rh(36),
            ),
            border: OutlineInputBorder(
              borderRadius: radius,
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: const BorderSide(color: ThemeColors.goldPrimary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: const BorderSide(color: ThemeColors.redEF4),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: const BorderSide(color: ThemeColors.redEF4),
            ),
            errorStyle: AppTextStyles.servicesCraftsmanTitle.copyWith(
              color: ThemeColors.redEF4,
              fontSize: context.rsp(11),
            ),
          ),
        ),
      ],
    );
  }
}

class ServiceRequestFieldLabel extends StatelessWidget {
  const ServiceRequestFieldLabel({
    required this.label,
    required this.isRequired,
    this.trailing,
    super.key,
  });

  final String label;
  final bool isRequired;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;

    return Text.rich(
      TextSpan(
        children: [
          if (isRequired)
            TextSpan(
              text: '* ',
              style: AppTextStyles.servicesCraftsmanName.copyWith(
                color: ThemeColors.goldPrimary,
                fontSize: context.rsp(13),
              ),
            ),
          TextSpan(
            text: label,
            style: AppTextStyles.servicesCraftsmanName.copyWith(
              color: textPrimary,
              fontSize: context.rsp(14),
              fontWeight: FontWeight.w600,
            ),
          ),
          if (trailing != null)
            TextSpan(
              text: ' $trailing',
              style: AppTextStyles.servicesSearchHint.copyWith(
                color: textSecondary,
                fontSize: context.rsp(12),
              ),
            ),
        ],
      ),
      textAlign: TextAlign.start,
    );
  }
}
