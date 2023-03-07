import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/views/animation/obacity.dart';

import '../../../utils/my_theme.dart';

class SplashCallToAction extends StatelessWidget {
  const SplashCallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimateObacity(
      curve: Curves.fastLinearToSlowEaseIn,
      isForward: true,
      duration: const Duration(seconds: 2),
      widget: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Text(
              'Let\'s Start',
              style: TextStyle(color: primaryColor, fontSize: 22.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.5.w),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
              style: TextStyle(
                  color: primaryColor.withOpacity(.5), fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
