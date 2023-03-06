
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/my_theme.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Enter your password',
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const Icon(
              Icons.remove_red_eye,
              color: Color(0xffe5ecfc),
            ),
          ),
          hintStyle: const TextStyle(color: Color(0xff72a2b8)),
          contentPadding: EdgeInsets.symmetric(vertical: 2.h),
          border: MyThemeData.borderRadius,
          enabledBorder: MyThemeData.borderRadius.copyWith(
              borderSide:
                  const BorderSide(color: Color.fromARGB(110, 114, 162, 184))),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const Icon(
              Icons.person,
              color: Color(0xffe5ecfc),
            ),
          )),
    );
  }
}
