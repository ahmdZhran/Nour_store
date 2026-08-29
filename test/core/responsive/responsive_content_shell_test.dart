import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nour_store/core/responsive/app_breakpoints.dart';
import 'package:nour_store/core/responsive/responsive_content_shell.dart';

void main() {
  Future<void> pumpShell(
    WidgetTester tester, {
    required Size screenSize,
    required Widget child,
  }) async {
    await tester.binding.setSurfaceSize(screenSize);
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, _) => MaterialApp(
          home: Scaffold(
            body: ResponsiveContentShell(child: child),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('uses full width on mobile', (tester) async {
    const screenWidth = 390.0;

    await pumpShell(
      tester,
      screenSize: const Size(screenWidth, 844),
      child: const _WidthProbe(key: Key('probe')),
    );

    final probeBox = tester.renderObject<RenderBox>(
      find.byKey(const Key('probe')),
    );

    // Mobile uses 20.w padding; child should be nearly full screen width.
    expect(probeBox.size.width, greaterThan(screenWidth - 50));
  });

  testWidgets('constrains and centers content on desktop', (tester) async {
    const screenWidth = 1200.0;

    await pumpShell(
      tester,
      screenSize: const Size(screenWidth, 800),
      child: const _WidthProbe(key: Key('probe')),
    );

    final probeBox = tester.renderObject<RenderBox>(
      find.byKey(const Key('probe')),
    );

    expect(
      probeBox.size.width,
      lessThanOrEqualTo(AppBreakpoints.contentMaxWidth),
    );
    expect(
      probeBox.size.width,
      greaterThan(AppBreakpoints.contentMaxWidth - 60),
    );

    final probeCenter = probeBox.localToGlobal(probeBox.size.center(Offset.zero));
    expect(probeCenter.dx, closeTo(screenWidth / 2, 1));
  });

  testWidgets('row children receive usable width on desktop', (tester) async {
    await pumpShell(
      tester,
      screenSize: const Size(1200, 800),
      child: Row(
        children: [
          const SizedBox(width: 48, height: 48),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  key: const Key('expanded-probe'),
                  width: constraints.maxWidth,
                  height: 48,
                );
              },
            ),
          ),
        ],
      ),
    );

    final probeBox = tester.renderObject<RenderBox>(
      find.byKey(const Key('expanded-probe')),
    );

    expect(probeBox.size.width, greaterThan(300));
  });
}

class _WidthProbe extends StatelessWidget {
  const _WidthProbe({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: 48,
          child: const ColoredBox(color: Colors.blue),
        );
      },
    );
  }
}
