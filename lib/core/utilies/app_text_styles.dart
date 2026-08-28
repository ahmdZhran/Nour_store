import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nour_store/core/theme/theme_colors.dart';

class AppTextStyles {
  // Legacy helpers (prefer Tickora styles below for new UI)
  static TextStyle regular16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle regularWhiteBold16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle regular12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle regular17BlueW700 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 17.sp,
  );

  static TextStyle regular11W500 = TextStyle(
    fontSize: 11.sp,
    color: Colors.grey.shade600,
    fontWeight: FontWeight.w500,
  );

  static TextStyle regular12GreyW500 = TextStyle(
    fontSize: 12.sp,
    color: Colors.grey.shade600,
    fontWeight: FontWeight.w500,
  );

  static TextStyle regularGrey16 = TextStyle(
    fontSize: 16.sp,
    color: Colors.grey.shade600,
    fontWeight: FontWeight.w500,
  );

  static TextStyle regularbold12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle regular10 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
  );

  // Tickora — titles / body
  static TextStyle title28W700 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.onBackground,
  );

  static TextStyle title18W700 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    color: AppColors.onBackground,
  );

  static TextStyle title18W700Primary = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.6,
    color: AppColors.primary,
  );

  static TextStyle title16W700 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.onBackground,
  );

  static TextStyle title15W600 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.onBackground,
  );

  static TextStyle labelCaps11PrimaryContainer = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: AppColors.onPrimaryContainer,
  );

  static TextStyle labelCaps11OnSurfaceVariant = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle title14W600 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.onBackground,
  );

  static TextStyle body14W600 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle body14OnSurfaceVariant = TextStyle(
    fontSize: 14.sp,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle body14SecondaryW600 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  );

  static TextStyle body12W500 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.onBackground,
  );

  static TextStyle body12W700 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.onBackground,
  );

  static TextStyle body12SecondaryW600 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  );

  static TextStyle body11OnSurfaceVariant = TextStyle(
    fontSize: 11.sp,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle body11SecondaryW600 = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  );

  // Tickora — labels / captions
  static TextStyle labelCaps10 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle labelCaps10Secondary = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: AppColors.secondary,
  );

  static TextStyle labelCaps10Outline = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.4,
    color: AppColors.outline,
  );

  static TextStyle labelCaps12W900 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w900,
    letterSpacing: 0.2,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle labelCaps9Outline = TextStyle(
    fontSize: 9.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.45,
    color: AppColors.outline,
  );

  static TextStyle caption10Outline = TextStyle(
    fontSize: 10.sp,
    color: AppColors.outline,
  );

  static TextStyle caption10OutlineW600 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.outline,
  );

  static TextStyle caption10Primary = TextStyle(
    fontSize: 10.sp,
    color: AppColors.primary,
  );

  static TextStyle caption8W600OnBackground = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.onBackground,
  );

  static TextStyle caption8W600Secondary = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  );

  static TextStyle caption8W600Tertiary = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.tertiary,
  );

  static TextStyle title24W600 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
    color: AppColors.onBackground,
  );

  static TextStyle title20W600Primary = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static TextStyle title16W600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.onBackground,
  );

  static TextStyle title13W700Primary = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
    color: AppColors.primary,
  );

  static TextStyle display22W700 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    height: 1.05,
    letterSpacing: -0.4,
    color: AppColors.onBackground,
  );

  static TextStyle caption9OnSurfaceVariant = TextStyle(
    fontSize: 9.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle title16W600Tertiary = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.tertiary,
  );

  static TextStyle display48W700Primary = TextStyle(
    fontSize: 48.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.8,
    color: AppColors.primary,
  );

  static TextStyle labelCaps11OnSurfaceVariantWide = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle body14OnBackground = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.onBackground,
  );

  static TextStyle body13OnSurfaceVariant = TextStyle(
    fontSize: 13.sp,
    height: 1.45,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle body13W500 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.onBackground,
  );

  // Tickora — mono / terminal numbers
  static TextStyle mono12OnSurfaceVariant = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'Courier',
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle mono13W600 = TextStyle(
    fontSize: 13.sp,
    fontFamily: 'Courier',
    fontWeight: FontWeight.w600,
    color: AppColors.onBackground,
  );

  static TextStyle mono13W600Tabular = TextStyle(
    fontSize: 13.sp,
    fontFamily: 'Courier',
    fontWeight: FontWeight.w600,
    height: 1.15,
    fontFeatures: const [FontFeature.tabularFigures()],
    color: AppColors.onBackground,
  );

  static TextStyle mono14W800Tabular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w800,
    height: 1.15,
    letterSpacing: -0.2,
    fontFeatures: const [FontFeature.tabularFigures()],
    color: AppColors.onBackground,
  );

  static TextStyle mono14W900Tabular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w900,
    height: 1.15,
    letterSpacing: -0.2,
    fontFeatures: const [FontFeature.tabularFigures()],
    color: AppColors.onBackground,
  );

  static TextStyle mono12W500Tabular = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'Courier',
    fontWeight: FontWeight.w500,
    fontFeatures: const [FontFeature.tabularFigures()],
    color: AppColors.onBackground,
  );

  static TextStyle mono12W700Tabular = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'Courier',
    fontWeight: FontWeight.w700,
    fontFeatures: const [FontFeature.tabularFigures()],
    color: AppColors.onBackground,
  );

  static TextStyle mono11W500Tabular = TextStyle(
    fontSize: 11.sp,
    fontFamily: 'Courier',
    fontWeight: FontWeight.w500,
    fontFeatures: const [FontFeature.tabularFigures()],
    color: AppColors.onBackground,
  );

  static TextStyle mono18W900Tabular3d = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w900,
    height: 1.05,
    letterSpacing: -0.3,
    fontFeatures: const [FontFeature.tabularFigures()],
    color: AppColors.onBackground,
    shadows: [
      Shadow(
        color: AppColors.background.withValues(alpha: 0.95),
        offset: const Offset(0, 1.8),
        blurRadius: 1.2,
      ),
      Shadow(
        color: AppColors.background.withValues(alpha: 0.55),
        offset: const Offset(0, 0.6),
        blurRadius: 0,
      ),
      Shadow(
        color: AppColors.onBackground.withValues(alpha: 0.28),
        offset: const Offset(0, -0.8),
        blurRadius: 0.5,
      ),
    ],
  );
}
