import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  static var white18 = GoogleFonts.aBeeZee(
      textStyle: TextStyle(color: Colors.white, fontSize: 18.sp));
  static var borderRadius = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.h),
      borderSide: const BorderSide(color: Colors.transparent));
}
