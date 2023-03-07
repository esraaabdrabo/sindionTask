import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/views/animation/obacity.dart';

class SummaryBox extends StatelessWidget {
  final String number;
  final String title;
  final Color color;
  const SummaryBox(
      {required this.color,
      required this.number,
      required this.title,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.h),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(6.w),
      ),
      height: 15.h,
      width: 30.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimateObacity(
            duration: const Duration(seconds: 2),
            isForward: true,
            curve: Curves.fastLinearToSlowEaseIn,
            widget: Text(
              number,
              style: GoogleFonts.aBeeZee(
                  fontSize: 22.sp, fontWeight: FontWeight.bold, color: color),
            ),
          ),
          AnimateObacity(
            duration: const Duration(seconds: 3),
            isForward: true,
            curve: Curves.fastLinearToSlowEaseIn,
            widget: Text(title,
                style: GoogleFonts.cairo(fontSize: 20.sp, color: color)),
          )
        ],
      ),
    );
  }
}
