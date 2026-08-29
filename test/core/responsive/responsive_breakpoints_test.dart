import 'package:flutter_test/flutter_test.dart';
import 'package:nour_store/core/responsive/app_breakpoints.dart';

void main() {
  group('AppBreakpoints', () {
    test('classifies mobile width', () {
      expect(AppBreakpoints.isMobileWidth(390), isTrue);
      expect(AppBreakpoints.isMobileWidth(599), isTrue);
      expect(AppBreakpoints.isMobileWidth(600), isFalse);
    });

    test('classifies tablet width', () {
      expect(AppBreakpoints.isTabletWidth(600), isTrue);
      expect(AppBreakpoints.isTabletWidth(1023), isTrue);
      expect(AppBreakpoints.isTabletWidth(599), isFalse);
      expect(AppBreakpoints.isTabletWidth(1024), isFalse);
    });

    test('classifies desktop width', () {
      expect(AppBreakpoints.isDesktopWidth(1024), isTrue);
      expect(AppBreakpoints.isDesktopWidth(1920), isTrue);
      expect(AppBreakpoints.isDesktopWidth(1023), isFalse);
    });

    test('returns infinite content max width on mobile', () {
      expect(
        AppBreakpoints.contentMaxWidthFor(390),
        double.infinity,
      );
    });

    test('returns fixed content max width on tablet and desktop', () {
      expect(
        AppBreakpoints.contentMaxWidthFor(768),
        AppBreakpoints.contentMaxWidth,
      );
      expect(
        AppBreakpoints.contentMaxWidthFor(1440),
        AppBreakpoints.contentMaxWidth,
      );
    });
  });
}
