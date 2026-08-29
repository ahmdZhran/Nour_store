import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nour_store/core/responsive/responsive_context.dart';

/// Scales dimensions on mobile via ScreenUtil; uses fixed logical pixels on
/// tablet/desktop so constrained web layouts are not blown up by full-viewport
/// scaling.
extension ResponsiveSizing on BuildContext {
  double rw(double value) => isMobile ? value.w : value;

  double rh(double value) => isMobile ? value.h : value;

  double rr(double value) => isMobile ? value.r : value;

  double rsp(double value) => isMobile ? value.sp : value;
}
