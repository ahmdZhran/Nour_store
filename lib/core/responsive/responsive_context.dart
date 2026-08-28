import 'package:flutter/material.dart';
import 'package:nour_store/core/responsive/app_breakpoints.dart';

extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  bool get isMobile => AppBreakpoints.isMobileWidth(screenWidth);

  bool get isTablet => AppBreakpoints.isTabletWidth(screenWidth);

  bool get isDesktop => AppBreakpoints.isDesktopWidth(screenWidth);

  double get contentMaxWidth =>
      AppBreakpoints.contentMaxWidthFor(screenWidth);
}
