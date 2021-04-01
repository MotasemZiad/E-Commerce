import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final Alignment alignment;
  final TextAlign textAlign;
  final TextDecoration decoration;
  final double height;
  final int maxLine;

  CustomText({
    this.text = '',
    this.fontSize = 16.0,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.alignment = Alignment.topLeft,
    this.textAlign = TextAlign.left,
    this.maxLine,
    this.height,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: decoration,
        height: height,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      maxLines: maxLine,
    );
  }
}
