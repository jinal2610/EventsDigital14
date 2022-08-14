import 'package:events_digital14/custom_class/components/text_widget.dart';
import 'package:events_digital14/helper_class/colors.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {

  final String text;
  final onPressed;
  final Color? color;
  final Color? textColor;
  final FontWeight fontWeight;
  final double fontSize;

  const TextButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.transparent,
    this.textColor = AppColors.whiteColor,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextButton(
      onPressed: onPressed,
      child: TextWidget(
        text: text,
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }


}