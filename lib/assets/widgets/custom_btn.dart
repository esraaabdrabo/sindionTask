import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/my_theme.dart';

class CustomBTN extends StatelessWidget {
  final Color color;
  final Function() function;
  final String text;
  final IconData? icon;
  const CustomBTN(
      {required this.color,
      required this.function,
      required this.text,
      this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: MaterialButton(
        minWidth: 100.w,
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.5.w),
        shape: MyThemeData.borderRadius,
        color: color,
        onPressed: function,
        child: icon == null
            ? Text(text, style: MyThemeData.white18)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text, style: MyThemeData.white18),
                  SizedBox(
                    width: 2.5.w,
                  ),
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 22.sp,
                  )
                ],
              ),
      ),
    );
  }
}
