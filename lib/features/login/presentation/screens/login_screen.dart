import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_content_shell.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/core/widgets/directional_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    Navigator.pushReplacementNamed(context, Routes.serviceRequest);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;

    return Scaffold(
      backgroundColor:
          isDark ? ThemeColors.darkBackground : ThemeColors.lightBackground,
      body: SafeArea(
        child: ResponsiveContentShell(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: context.rh(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(
                        minWidth: context.rw(36),
                        minHeight: context.rh(36),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const BackArrowIcon(
                        color: ThemeColors.goldPrimary,
                        size: 20,
                      ),
                    ),
                  ),
                  const Center(child: _BrandMark()),
                  SizedBox(height: context.rh(10)),
                  Text(
                    context.tr(AppStrings.logIn),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.sectionTitle.copyWith(
                      color: textPrimary,
                      fontSize: context.rsp(24),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: context.rh(14)),
                  _LoginField(
                    label: context.tr(AppStrings.emailAddress),
                    hint: context.tr(AppStrings.registerEmailHint),
                    controller: _emailController,
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
                      if (email.isEmpty) {
                        return context.tr(AppStrings.emailRequired);
                      }
                      if (!_isValidEmail(email)) {
                        return context.tr(AppStrings.emailInvalid);
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: context.rh(10)),
                  _LoginField(
                    label: context.tr(AppStrings.password),
                    hint: context.tr(AppStrings.passwordHint),
                    controller: _passwordController,
                    isRequired: true,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.done,
                    suffix: _VisibilityToggle(
                      obscure: _obscurePassword,
                      onPressed: () => setState(
                        () => _obscurePassword = !_obscurePassword,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.tr(AppStrings.passwordRequired);
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: context.rh(16)),
                  _LoginButton(onPressed: _submit),
                  SizedBox(height: context.rh(12)),
                  const _SignUpPrompt(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

bool _isValidEmail(String value) {
  return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value);
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    final size = context.rw(64);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ThemeColors.darkSurface,
        border: Border.all(color: ThemeColors.goldPrimary, width: 2),
      ),
      child: Icon(
        Icons.storefront_outlined,
        color: ThemeColors.goldPrimary,
        size: context.rsp(28),
      ),
    );
  }
}

class _LoginField extends StatelessWidget {
  const _LoginField({
    required this.label,
    required this.hint,
    required this.controller,
    this.isRequired = false,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.suffix,
    this.validator,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isRequired;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? suffix;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final hintColor =
        isDark ? ThemeColors.darkTextHint : ThemeColors.lightTextSecondary;
    final radius = BorderRadius.circular(context.rr(12));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _FieldLabel(label: label, isRequired: isRequired),
        SizedBox(height: context.rh(4)),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          validator: validator,
          style: AppTextStyles.servicesCraftsmanName.copyWith(
            color: textPrimary,
            fontSize: context.rsp(14),
            height: 1.2,
          ),
          cursorColor: ThemeColors.goldPrimary,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.servicesSearchHint.copyWith(
              color: hintColor,
              fontSize: context.rsp(14),
            ),
            isDense: true,
            filled: true,
            fillColor: ThemeColors.darkSurface,
            contentPadding: EdgeInsetsDirectional.symmetric(
              horizontal: context.rw(14),
              vertical: context.rh(10),
            ),
            suffixIcon: suffix,
            suffixIconConstraints: BoxConstraints(
              minWidth: context.rw(40),
              minHeight: context.rh(36),
            ),
            border: OutlineInputBorder(
              borderRadius: radius,
              borderSide: BorderSide(
                color: ThemeColors.lightBorder.withValues(alpha: 0.4),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: BorderSide(
                color: ThemeColors.lightBorder.withValues(alpha: 0.4),
              ),
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

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({
    required this.label,
    required this.isRequired,
  });

  final String label;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;

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
              fontSize: context.rsp(13),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.start,
    );
  }
}

class _VisibilityToggle extends StatelessWidget {
  const _VisibilityToggle({
    required this.obscure,
    required this.onPressed,
  });

  final bool obscure;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        color: ThemeColors.darkTextSecondary,
        size: context.rsp(20),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.rh(46),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: ThemeColors.goldPrimary,
          foregroundColor: ThemeColors.blackColorF1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.rr(14)),
          ),
        ),
        child: Text(
          context.tr(AppStrings.logIn),
          style: AppTextStyles.servicesCraftsmanName.copyWith(
            color: ThemeColors.blackColorF1,
            fontSize: context.rsp(16),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _SignUpPrompt extends StatelessWidget {
  const _SignUpPrompt();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;

    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, Routes.register),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${context.tr(AppStrings.dontHaveAccount)} ',
              style: AppTextStyles.servicesSearchHint.copyWith(
                color: textSecondary,
                fontSize: context.rsp(14),
              ),
            ),
            TextSpan(
              text: context.tr(AppStrings.createAccount),
              style: AppTextStyles.servicesCraftsmanName.copyWith(
                color: ThemeColors.goldPrimary,
                fontSize: context.rsp(14),
                decoration: TextDecoration.underline,
                decorationColor: ThemeColors.goldPrimary,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
