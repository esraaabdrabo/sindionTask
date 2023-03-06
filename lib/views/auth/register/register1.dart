import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/constants.dart';
import 'package:sindion/assets/my_theme.dart';
import 'package:sindion/assets/widgets/custom_appBar.dart';
import 'package:sindion/assets/widgets/custom_btn.dart';
import 'package:sindion/views/auth/validators.dart';
import 'package:sindion/views/auth/widgets/form_field.dart';

import '../../../assets/functions.dart';
import '../../../view_model/auth.dart';
import 'options/data.dart';
import 'register2.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  TextEditingController nameCont = TextEditingController();
  TextEditingController nationalIDcont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nationalIDcont.dispose();
    nameCont.dispose();
    emailCont.dispose();
    phoneCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthVM authProvider = Provider.of(context);

    return Scaffold(
      appBar: createCustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Form(
            key: formKey,
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
                    controller: nameCont,
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
                    controller: nationalIDcont,
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
                    controller: emailCont,
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
                    controller: phoneCont,
                    validator: (String value) {
                      return AuthValidators.validatePhone(value);
                    },
                    icon: Icons.phone),
                CustomBTN(
                  color: primaryColor,
                  function: () {
                    if (formKey.currentState!.validate()) {
                      authProvider.setFirstUserData(
                          email: emailCont.text,
                          name: nameCont.text,
                          nationalID: nationalIDcont.text,
                          phone: phoneCont.text);
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
