import 'package:flutter/material.dart';

class SizeConfig {

  static late MediaQueryData _mediaQuery;
  static late double screenWidth;
  static late double screenHeight;

  void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    screenWidth = _mediaQuery.size.width;
    screenHeight = _mediaQuery.size.height;
  }
}

Widget horizontalSpace(BuildContext context, double space) {
  return SizedBox(
    width: space,
  );
}

Widget verticalSpace(BuildContext context, double space) {
  return SizedBox(
    height: space,
  );
}

