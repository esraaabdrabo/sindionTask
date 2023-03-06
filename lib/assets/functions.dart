import 'package:flutter/material.dart';

import 'my_theme.dart';

goto({required BuildContext context, required Widget screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

gotoReplacement({required BuildContext context, required Widget screen}) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => screen));
}

showSnackBar({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: secondaryColor,
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: MyThemeData.white18,
      )));
}
