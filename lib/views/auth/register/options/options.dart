import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/widgets/custom_appBar.dart';
import 'package:sindion/views/auth/register/options/data.dart';

import 'package:sindion/views/auth/register/options/option_card.dart';

import '../../../../assets/functions.dart';
import '../../../../assets/my_theme.dart';
import '../../../../assets/widgets/custom_btn.dart';
import '../register1.dart';

class RegisterOptions extends StatelessWidget {
  const RegisterOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createCustomAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: 5.h,
                        ),
                    itemCount: optionsData.length,
                    itemBuilder: (context, index) => OptionCard(
                          index: index,
                        )),
              ),
              CustomBTN(
                  color: primaryColor,
                  function: () {
                    goto(context: context, screen: const Register1());
                  },
                  text: "Register now")
            ],
          )),
    );
  }
}
