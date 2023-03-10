import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../utils/my_theme.dart';

class ActionText extends StatelessWidget {
  final String question;
  final Function() function;
  const ActionText({required this.function, required this.question, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: function,
          child: RichText(
            text: TextSpan(
                style: GoogleFonts.aBeeZee(
                    color: primaryColor.withOpacity(.4), fontSize: 16.sp),
                children: [
                  TextSpan(text: question),
                  TextSpan(
                      text: ' Click Here',
                      style:
                          GoogleFonts.aBeeZee(color: const Color(0xfff7af0c)))
                ]),
          )),
    );
  }
}
