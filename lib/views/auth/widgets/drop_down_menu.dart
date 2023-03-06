import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../utils/my_theme.dart';
import 'field_label.dart';

class CustomDropDown extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final List<String> options;
  final Function(String value) function;
  const CustomDropDown(
      {required this.hint,
      required this.label,
      required this.function,
      required this.icon,
      required this.options,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormFieldLabel(text: label),
        DropdownButtonFormField<String>(
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                hintText: hint,
                hintStyle: const TextStyle(color: Color(0xff72a2b8)),
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
            items: options
                .map((country) => DropdownMenuItem<String>(
                    value: country, child: Text(country)))
                .toList(),
            onChanged: (value) {
              function(value!);
            }),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }
}
