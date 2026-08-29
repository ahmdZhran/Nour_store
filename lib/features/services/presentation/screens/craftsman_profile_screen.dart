import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_content_shell.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/core/widgets/directional_icon.dart';
import 'package:nour_store/features/services/presentation/models/craftsman_profile_mock_data.dart';
import 'package:nour_store/features/services/presentation/widgets/craftsman_portfolio_grid_widget.dart';
import 'package:nour_store/features/services/presentation/widgets/craftsman_profile_header_widget.dart';

class CraftsmanProfileScreen extends StatelessWidget {
  const CraftsmanProfileScreen({
    super.key,
    required this.profile,
  });

  final CraftsmanProfileData profile;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;

    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: _LowerCenterFloatFabLocation(
        bottomMargin: context.rh(8),
      ),
      floatingActionButton: _QuoteFab(labelKey: profile.ctaKey),
      body: Column(
        children: [
          _ProfileTopBar(titleKey: profile.nameKey),
          Expanded(
            child: ResponsiveContentShell(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: context.rh(16),
                  bottom: context.rh(100),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CraftsmanProfileHeaderWidget(profile: profile),
                    SizedBox(height: context.rh(32)),
                    _SectionTitle(
                      title:
                          '${context.tr(AppStrings.craftsmanProfileAboutTitle)} ${context.tr(profile.nameKey)}',
                      textColor: textPrimary,
                    ),
                    SizedBox(height: context.rh(12)),
                    Text(
                      context.tr(profile.aboutKey),
                      textAlign: TextAlign.justify,
                      style: AppTextStyles.subtitleMedium.copyWith(
                        color: textSecondary,
                        fontSize: context.rsp(16),
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: context.rh(32)),
                    _SectionTitle(
                      title:
                          context.tr(AppStrings.craftsmanProfilePortfolioTitle),
                      textColor: textPrimary,
                    ),
                    SizedBox(height: context.rh(16)),
                    CraftsmanPortfolioGridWidget(
                      imageAssets: profile.portfolioAssets,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileTopBar extends StatelessWidget {
  const _ProfileTopBar({required this.titleKey});

  final String titleKey;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          color: ThemeColors.darkBackground.withValues(alpha: 0.8),
          child: SafeArea(
            bottom: false,
            child: SizedBox(
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
                      context.tr(titleKey),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.sectionTitle.copyWith(
                        color: ThemeColors.darkTextPrimary,
                        fontSize: context.rsp(18),
                      ),
                    ),
                  ),
                  SizedBox(width: context.rw(48)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    required this.textColor,
  });

  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: AppTextStyles.sectionTitle.copyWith(
            color: textColor,
            fontSize: context.rsp(17),
          ),
        ),
        SizedBox(height: context.rh(8)),
        Divider(
          color: ThemeColors.lightBorder.withValues(alpha: 0.3),
          height: 1,
        ),
      ],
    );
  }
}

class _QuoteFab extends StatelessWidget {
  const _QuoteFab({required this.labelKey});

  final String labelKey;

  static const double _borderRadius = 14;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      backgroundColor: ThemeColors.goldPrimary,
      foregroundColor: ThemeColors.blackColorF1,
      elevation: 8,
      highlightElevation: 12,
      extendedPadding: EdgeInsetsDirectional.symmetric(
        horizontal: context.rw(40),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.rr(_borderRadius)),
      ),
      label: ConstrainedBox(
        constraints: BoxConstraints(minWidth: context.rw(200)),
        child: Text(
          context.tr(labelKey),
          textAlign: TextAlign.center,
          style: AppTextStyles.servicesCraftsmanName.copyWith(
            color: ThemeColors.blackColorF1,
            fontSize: context.rsp(14),
          ),
        ),
      ),
    );
  }
}

class _LowerCenterFloatFabLocation extends FloatingActionButtonLocation {
  const _LowerCenterFloatFabLocation({required this.bottomMargin});

  final double bottomMargin;

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final fabSize = scaffoldGeometry.floatingActionButtonSize;
    final scaffoldSize = scaffoldGeometry.scaffoldSize;
    return Offset(
      (scaffoldSize.width - fabSize.width) / 2,
      scaffoldSize.height - fabSize.height - bottomMargin,
    );
  }
}
