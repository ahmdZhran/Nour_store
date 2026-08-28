import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nour_store/core/responsive/responsive_context.dart';

/// Centers and constrains screen content on tablet/desktop while keeping
/// full-width layout on mobile.
class ResponsiveContentShell extends StatelessWidget {
  const ResponsiveContentShell({
    super.key,
    required this.child,
    this.alignment = Alignment.topCenter,
    this.expandVertically = false,
  });

  final Widget child;
  final Alignment alignment;

  /// When true, the shell fills the available height so flex children
  /// (e.g. [Spacer]) can expand inside [Column].
  final bool expandVertically;

  static const double _largeScreenHorizontalPadding = 24;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding =
        context.isMobile ? 20.w : _largeScreenHorizontalPadding;
    final maxWidth = context.contentMaxWidth;

    final paddedChild = Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: horizontalPadding,
      ),
      child: SizedBox(
        width: double.infinity,
        height: expandVertically ? double.infinity : null,
        child: child,
      ),
    );

    return Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: paddedChild,
      ),
    );
  }
}
