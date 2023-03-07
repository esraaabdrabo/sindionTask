import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/widgets/custom_btn.dart';
import 'package:sindion/view_model/auth.dart';
import 'package:sindion/views/home/home.dart';
import '../utils/constants.dart';
import '../utils/functions.dart';
import '../utils/my_theme.dart';
import 'auth/login/login.dart';

// ignore: must_be_immutable
class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    AuthVM authProvider = Provider.of(context);
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
            CustomBTN(
                color: primaryColor,
                function: () async {
                  gotoReplacement(
                      context: context,
                      screen: await authProvider.checkIfUserSignedIn()
                          ? const Home()
                          : const Login());
                },
                text: "Get Started")
          ],
        ),
      ),
    );
  }
}
