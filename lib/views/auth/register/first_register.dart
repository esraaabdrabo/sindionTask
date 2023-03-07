import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/widgets/custom_appBar.dart';
import 'package:sindion/assets/widgets/custom_btn.dart';
import 'package:sindion/views/auth/validators.dart';
import 'package:sindion/views/auth/widgets/form_field.dart';
import '../../../utils/constants.dart';
import '../../../utils/functions.dart';
import '../../../utils/my_theme.dart';
import '../../../view_model/auth.dart';
import 'options/data.dart';
import 'second_register.dart';

class Register1 extends StatelessWidget {
  const Register1({super.key});

  @override
  Widget build(BuildContext context) {
    AuthVM authProvider = Provider.of(context);

    return Scaffold(
      appBar: createCustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Form(
            key: authProvider.formKey1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                      width: 75.w, child: Image.asset(Constants.registerIMG)),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: Text(
                    'Register as ${optionsData[int.parse(authProvider.user.userType)]['description']}',
                    style: TextStyle(color: primaryColor, fontSize: 20.sp),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustomFormField(
                    label: "Full name",
                    hint: 'Enter your name',
                    controller: authProvider.nameCont,
                    validator: (String value) {
                      return AuthValidators.validateName(value);
                    },
                    icon: Icons.person),
                SizedBox(
                  height: 1.h,
                ),
                CustomFormField(
                    label: "National ID number",
                    hint: 'Enter your ID number',
                    controller: authProvider.nationalIDcont,
                    validator: (String value) {
                      return AuthValidators.validateNationalID(value);
                    },
                    icon: Icons.credit_card),
                SizedBox(
                  height: 1.h,
                ),
                CustomFormField(
                    label: "Email",
                    hint: 'Enter your email',
                    controller: authProvider.emailCont,
                    validator: (String value) {
                      return AuthValidators.validateEmail(value);
                    },
                    icon: Icons.email),
                SizedBox(
                  height: 1.h,
                ),
                CustomFormField(
                    label: "Phone Number",
                    hint: 'Enter your phone number',
                    controller: authProvider.phoneCont,
                    validator: (String value) {
                      return AuthValidators.validatePhone(value);
                    },
                    icon: Icons.phone),
                CustomBTN(
                  color: primaryColor,
                  function: () {
                    if (authProvider.formKey1.currentState!.validate()) {
                      goto(context: context, screen: const Register2());
                    }
                  },
                  text: 'Next',
                  icon: Icons.arrow_right_alt_outlined,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
