import 'package:flutter/material.dart';

/// Trailing "navigate forward" chevron that mirrors correctly in RTL/LTR.
class ForwardChevronIcon extends StatelessWidget {
  const ForwardChevronIcon({
    super.key,
    this.size,
    this.color,
  });

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Icon(
        isRtl ? Icons.chevron_left_rounded : Icons.chevron_right_rounded,
        size: size,
        color: color,
      ),
    );
  }
}

/// Back arrow for app bars and sheets — mirrors correctly in RTL/LTR.
class BackArrowIcon extends StatelessWidget {
  const BackArrowIcon({
    super.key,
    this.size,
    this.color,
  });

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Icon(
        isRtl ? Icons.arrow_forward_rounded : Icons.arrow_back_rounded,
        size: size,
        color: color,
      ),
    );
  }
}
