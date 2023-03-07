import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/my_theme.dart';

class EvaluationTitleAndStatus extends StatelessWidget {
  const EvaluationTitleAndStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Evaluation Purpose",
          style: MyThemeData.titleTS.copyWith(fontSize: 16.sp),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(5.w),
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
              color: const Color(0xfff8db9a),
              child: Text(
                "Pending",
                style: GoogleFonts.aBeeZee(color: primaryColor),
              )),
        )
      ],
    );
  }
}
