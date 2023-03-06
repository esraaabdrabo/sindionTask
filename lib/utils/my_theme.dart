import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

var secodaryColor = const Color(0xfff7af0c);
var primaryColor = const Color(0xff146489);
var lightGrey = const Color(0xfff8fafb);

abstract class MyTheme {
  static var customTheme = ThemeData.light().copyWith(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secodaryColor));
}

abstract class MyThemeData {
  static var white18 = GoogleFonts.aBeeZee(
      textStyle: TextStyle(color: Colors.white, fontSize: 18.sp));
  static var titleTS = GoogleFonts.aBeeZee(
      fontWeight: FontWeight.w600, color: primaryColor, fontSize: 18.sp);

  static var subTitleTS =
      GoogleFonts.aBeeZee(color: primaryColor.withOpacity(.8), fontSize: 16.sp);
  static var borderRadius = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.h),
      borderSide: const BorderSide(color: Colors.transparent));
}
