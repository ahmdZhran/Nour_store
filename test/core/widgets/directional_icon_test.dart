import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nour_store/core/widgets/directional_icon.dart';

void testWidgetsWithDirection({
  required TextDirection textDirection,
  required void Function(Icon forward, Icon back) assertIcons,
}) {
  testWidgets('directional icons for $textDirection layout', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Directionality(
          textDirection: textDirection,
          child: const Scaffold(
            body: Column(
              children: [
                ForwardChevronIcon(key: Key('forward')),
                BackArrowIcon(key: Key('back')),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final forward = tester.widget<Icon>(
      find.descendant(
        of: find.byKey(const Key('forward')),
        matching: find.byType(Icon),
      ),
    );
    final back = tester.widget<Icon>(
      find.descendant(
        of: find.byKey(const Key('back')),
        matching: find.byType(Icon),
      ),
    );

    assertIcons(forward, back);
  });
}

void main() {
  testWidgetsWithDirection(
    textDirection: TextDirection.rtl,
    assertIcons: (forward, back) {
      expect(forward.icon, Icons.chevron_left_rounded);
      expect(back.icon, Icons.arrow_forward_rounded);
    },
  );

  testWidgetsWithDirection(
    textDirection: TextDirection.ltr,
    assertIcons: (forward, back) {
      expect(forward.icon, Icons.chevron_right_rounded);
      expect(back.icon, Icons.arrow_back_rounded);
    },
  );
}
