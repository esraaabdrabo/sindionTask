import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/views/animation/offset.dart';
import 'package:sindion/views/auth/widgets/field_label.dart';

import '../../../utils/my_theme.dart';

class CustomFormField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final Function(String) validator;
  final TextInputType keyboardType;
  const CustomFormField(
      {required this.label,
      required this.controller,
      required this.validator,
      required this.hint,
      required this.icon,
      required this.keyboardType,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormFieldLabel(text: label),
        AnimateOffset(
          begin: const Offset(1, 0),
          end: Offset.zero,
          isForward: true,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(seconds: 3),
          widget: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            validator: (value) => validator(value!),
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Color(0xff72a2b8)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                border: MyThemeData.borderRadius,
                enabledBorder: MyThemeData.borderRadius.copyWith(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(100, 114, 162, 184))),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Icon(
                    icon,
                    color: const Color(0xffe5ecfc),
                  ),
                )),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }
}
