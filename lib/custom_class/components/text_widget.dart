import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {

  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;
  final int? maxLines;

  const TextWidget({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.justify,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
    );
  }


}