import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../assets/my_theme.dart';

class FormFieldLabel extends StatelessWidget {
  final String text;
  const FormFieldLabel({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Text(
        text,
        style: GoogleFonts.aBeeZee(
            color: secondaryColor.withOpacity(.8),
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
            fontSize: 17.sp),
      ),
    );
  }
}
