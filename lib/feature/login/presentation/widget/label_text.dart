import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;
  final bool bold;
  final Color? color;
  final double fontSize;
  final TextAlign textAlign;

  const LabelText(
    this.text, {
    super.key,
    this.color = Colors.white,
    this.textAlign = TextAlign.start,
    this.bold = false,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle2?.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
          ),
      textAlign: textAlign,
    );
  }
}
