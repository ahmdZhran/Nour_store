/// Shared width breakpoints for mobile, tablet, and desktop layouts.
abstract final class AppBreakpoints {
  static const double mobileMax = 599;
  static const double tabletMax = 1023;

  /// Default max content width on tablet/desktop (selection screens, forms).
  static const double contentMaxWidth = 480;

  /// Wider max content width for future full-width layouts (e.g. product grids).
  static const double wideContentMaxWidth = 720;

  static bool isMobileWidth(double width) => width <= mobileMax;

  static bool isTabletWidth(double width) =>
      width > mobileMax && width <= tabletMax;

  static bool isDesktopWidth(double width) => width > tabletMax;

  static double contentMaxWidthFor(double width) =>
      isMobileWidth(width) ? double.infinity : contentMaxWidth;
}
