import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Bottom clearance (logical px, pre-`.h` scaling) reserved behind the compact
/// navigation bar so content stays above the system home indicator.
const double kFloatingNavBarClearance = 78;

class VerticalSpace extends StatelessWidget {
  final double height;
  const VerticalSpace(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h);
  }
}

class HorizontalSpace extends StatelessWidget {
  final double width;
  const HorizontalSpace(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.w);
  }
}
