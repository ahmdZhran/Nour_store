import 'package:flutter/material.dart';

/// Renders [text] in a forced LTR run so signs and currency stay in place
/// under an RTL [Directionality] (e.g. `+2.6%`, `$211.94`).
class LtrText extends StatelessWidget {
  const LtrText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      textDirection: TextDirection.ltr,
    );
  }
}
