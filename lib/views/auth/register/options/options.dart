import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/widgets/custom_appBar.dart';
import 'package:sindion/view_model/auth.dart';
import 'package:sindion/views/auth/register/options/data.dart';
import 'package:sindion/views/auth/register/options/option_card.dart';
import '../../../../assets/widgets/custom_btn.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/my_theme.dart';
import '../first_register.dart';

class RegisterOptions extends StatelessWidget {
  const RegisterOptions({super.key});

  @override
  Widget build(BuildContext context) {
    AuthVM authProvider = Provider.of(context);
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
                    authProvider.user.userType != ''
                        ? goto(context: context, screen: const Register1())
                        : showSnackBar(
                            context: context,
                            backGroundColor: Colors.red,
                            text: 'Please choose any option.');
                  },
                  text: "Register now")
            ],
          )),
    );
  }
}
