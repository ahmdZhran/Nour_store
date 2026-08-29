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

  // Main selection
  static TextStyle titleLarge = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle subtitleMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle cardTitle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle cardDescription = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle placeholderTitle = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
  );
}
