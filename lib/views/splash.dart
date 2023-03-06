import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/my_theme.dart';
import 'package:sindion/assets/widgets/custom_btn.dart';
import 'package:sindion/services/auth/auth.dart';
import 'package:sindion/views/auth/register/register1.dart';
import 'package:sindion/views/auth/register/register2.dart';

import '../assets/constants.dart';
import '../assets/functions.dart';
import 'auth/login/login.dart';

// ignore: must_be_immutable
class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fd),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Constants.splashIMG),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: Text(
                'Let\'s Start',
                style: TextStyle(color: secondaryColor, fontSize: 22.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.5.w),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                style: TextStyle(
                    color: secondaryColor.withOpacity(.5), fontSize: 14.sp),
              ),
            ),
            CustomBTN(
                color: secondaryColor,
                function: () {
                  gotoReplacement(context: context, screen: const Login());
                },
                text: "Get Started")
          ],
        ),
      ),
    );
  }
}
