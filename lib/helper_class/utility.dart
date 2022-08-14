import 'package:flutter/material.dart';

navigateToNextScreen(BuildContext context, Widget pageWidget) {

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return pageWidget;
    },),
  );
}

void navigateToScreenWithCallback(
    BuildContext context,
    Widget screenWidget, {
      required onCallbackReceived,
    }) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return screenWidget;
      },
    ),
  ).then((value) {
      onCallbackReceived(value);
    },
  );
}

navigateToPrevScreen(BuildContext context, String value) {

  Navigator.of(context).pop(value);
}