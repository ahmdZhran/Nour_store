import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_content_shell.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/core/widgets/directional_icon.dart';
import 'package:nour_store/features/services/presentation/widgets/profile_avatar_upload.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({super.key});

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final _nameController = TextEditingController(text: 'احمد مجدي');
  final _emailController = TextEditingController(text: 'username@app.com');
  final _phoneController = TextEditingController(text: '+20 102 030 4000');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _save() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.tr(AppStrings.profileSaveSuccess))),
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
                      context.tr(AppStrings.profilePersonalData),
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
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: context.rh(24)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ProfileAvatarUpload(
                        onUploadTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                context.tr(AppStrings.profileUploadComingSoon),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: context.rh(24)),
                      Text(
                        context.tr(AppStrings.profileChangeDetails),
                        style: AppTextStyles.servicesCraftsmanName.copyWith(
                          color: textPrimary,
                          fontSize: context.rsp(14),
                        ),
                      ),
                      SizedBox(height: context.rh(14)),
                      _ProfileEditableField(
                        label: context.tr(AppStrings.fullName),
                        controller: _nameController,
                        icon: Icons.person_outline_rounded,
                        textPrimary: textPrimary,
                        textSecondary: textSecondary,
                      ),
                      SizedBox(height: context.rh(12)),
                      _ProfileEditableField(
                        label: context.tr(AppStrings.emailAddress),
                        controller: _emailController,
                        icon: Icons.mail_outline_rounded,
                        keyboardType: TextInputType.emailAddress,
                        textPrimary: textPrimary,
                        textSecondary: textSecondary,
                      ),
                      SizedBox(height: context.rh(12)),
                      _ProfileEditableField(
                        label: context.tr(AppStrings.profilePhoneLabel),
                        controller: _phoneController,
                        icon: Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
                        textPrimary: textPrimary,
                        textSecondary: textSecondary,
                      ),
                      SizedBox(height: context.rh(28)),
                      SizedBox(
                        height: context.rh(46),
                        child: FilledButton(
                          onPressed: _save,
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
                            context.tr(AppStrings.profileSaveChanges),
                            style: AppTextStyles.servicesCraftsmanTitle.copyWith(
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
          ],
        ),
      ),
    );
  }
}

class _ProfileEditableField extends StatelessWidget {
  const _ProfileEditableField({
    required this.label,
    required this.controller,
    required this.icon,
    required this.textPrimary,
    required this.textSecondary,
    this.keyboardType,
  });

  final String label;
  final TextEditingController controller;
  final IconData icon;
  final Color textPrimary;
  final Color textSecondary;
  final TextInputType? keyboardType;

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
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: AppTextStyles.servicesCraftsmanName.copyWith(
            color: textPrimary,
            fontSize: context.rsp(14),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: ThemeColors.darkSurface,
            prefixIcon: Icon(
              icon,
              color: ThemeColors.goldPrimary,
              size: context.rsp(20),
            ),
            suffixIcon: Icon(
              Icons.edit_outlined,
              color: ThemeColors.goldPrimary,
              size: context.rsp(18),
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
          ),
        ),
      ],
    );
  }
}
