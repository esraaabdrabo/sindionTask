import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

var primaryColor = const Color.fromARGB(255, 97, 173, 235);
var secondaryColor = const Color(0xff146489);

abstract class MyTheme {
  static lightTheme(BuildContext context) {
    Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: primaryColor, secondary: Colors.white));
  }
}

abstract class MyThemeData {
  static var bRadius50 = const BorderRadius.all(Radius.circular(50));
  static var bRadius25 = const BorderRadius.all(Radius.circular(25));
  static var sPadding25h12 =
      const EdgeInsets.symmetric(horizontal: 25, vertical: 12);
  static var borderRadius = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.h),
      borderSide: BorderSide(color: Colors.transparent));
}
