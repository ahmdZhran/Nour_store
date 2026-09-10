import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_content_shell.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/core/widgets/directional_icon.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.tr(AppStrings.profilePasswordChangeSuccess)),
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: context.rh(56),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const BackArrowIcon(
                      color: ThemeColors.goldPrimary,
                      size: 22,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      context.tr(AppStrings.profileChangePassword),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.sectionTitle.copyWith(
                        color: textPrimary,
                        fontSize: context.rsp(18),
                      ),
                    ),
                  ),
                  SizedBox(width: context.rw(48)),
                ],
              ),
            ),
            Expanded(
              child: ResponsiveContentShell(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: context.rh(24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _PasswordField(
                          label: context.tr(AppStrings.profileCurrentPassword),
                          controller: _currentController,
                          obscureText: _obscureCurrent,
                          textPrimary: textPrimary,
                          textSecondary: textSecondary,
                          onToggleVisibility: () {
                            setState(() => _obscureCurrent = !_obscureCurrent);
                          },
                          validator: (value) {
                            if ((value ?? '').trim().isEmpty) {
                              return context.tr(AppStrings.passwordRequired);
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: context.rh(14)),
                        _PasswordField(
                          label: context.tr(AppStrings.profileNewPassword),
                          controller: _newController,
                          obscureText: _obscureNew,
                          textPrimary: textPrimary,
                          textSecondary: textSecondary,
                          onToggleVisibility: () {
                            setState(() => _obscureNew = !_obscureNew);
                          },
                          validator: (value) {
                            if ((value ?? '').trim().isEmpty) {
                              return context.tr(AppStrings.passwordRequired);
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: context.rh(14)),
                        _PasswordField(
                          label: context.tr(AppStrings.confirmPassword),
                          controller: _confirmController,
                          obscureText: _obscureConfirm,
                          textPrimary: textPrimary,
                          textSecondary: textSecondary,
                          onToggleVisibility: () {
                            setState(() => _obscureConfirm = !_obscureConfirm);
                          },
                          validator: (value) {
                            if ((value ?? '').trim().isEmpty) {
                              return context
                                  .tr(AppStrings.confirmPasswordRequired);
                            }
                            if (value != _newController.text) {
                              return context.tr(AppStrings.passwordsDoNotMatch);
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: context.rh(28)),
                        SizedBox(
                          height: context.rh(46),
                          child: FilledButton(
                            onPressed: _submit,
                            style: FilledButton.styleFrom(
                              backgroundColor: ThemeColors.goldPrimary,
                              foregroundColor: ThemeColors.whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(context.rr(10)),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              context.tr(
                                AppStrings.profileConfirmPasswordAction,
                              ),
                              style:
                                  AppTextStyles.servicesCraftsmanTitle.copyWith(
                                color: ThemeColors.whiteColor,
                                fontSize: context.rsp(14),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.label,
    required this.controller,
    required this.obscureText,
    required this.textPrimary,
    required this.textSecondary,
    required this.onToggleVisibility,
    required this.validator,
  });

  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final Color textPrimary;
  final Color textSecondary;
  final VoidCallback onToggleVisibility;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: AppTextStyles.servicesCraftsmanTitle.copyWith(
            color: textSecondary,
            fontSize: context.rsp(12),
          ),
        ),
        SizedBox(height: context.rh(6)),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          style: AppTextStyles.servicesCraftsmanName.copyWith(
            color: textPrimary,
            fontSize: context.rsp(14),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: ThemeColors.darkSurface,
            prefixIcon: Icon(
              Icons.lock_outline_rounded,
              color: ThemeColors.goldPrimary,
              size: context.rsp(20),
            ),
            suffixIcon: IconButton(
              onPressed: onToggleVisibility,
              icon: Icon(
                obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: ThemeColors.goldPrimary,
                size: context.rsp(20),
              ),
            ),
            contentPadding: EdgeInsetsDirectional.symmetric(
              horizontal: context.rw(12),
              vertical: context.rh(14),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(context.rr(12)),
              borderSide: BorderSide(
                color: ThemeColors.lightBorder.withValues(alpha: 0.3),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(context.rr(12)),
              borderSide: BorderSide(
                color: ThemeColors.lightBorder.withValues(alpha: 0.3),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(context.rr(12)),
              borderSide: const BorderSide(color: ThemeColors.goldPrimary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(context.rr(12)),
              borderSide: const BorderSide(color: ThemeColors.redColorF9),
            ),
          ),
        ),
      ],
    );
  }
}
