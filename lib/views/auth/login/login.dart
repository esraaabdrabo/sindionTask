import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/constants.dart';
import 'package:sindion/assets/functions.dart';
import 'package:sindion/assets/my_theme.dart';
import 'package:sindion/assets/widgets/custom_btn.dart';
import 'package:sindion/views/auth/login/widgets/password_field.dart';
import 'package:sindion/views/auth/register/options/options.dart';
import 'package:sindion/views/auth/widgets/action_text.dart';
import 'package:sindion/views/auth/widgets/field_label.dart';
import 'package:sindion/views/auth/widgets/form_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Constants.loginIMG),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit,eiusmod tempor',
                style: TextStyle(
                    color: secondaryColor.withOpacity(.5), fontSize: 16.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomFormField(
                  label: "User name",
                  hint: 'Enter your user name',
                  controller: TextEditingController(),
                  validator: (String value) {},
                  icon: Icons.person),
              const FormFieldLabel(text: "Password"),
              const PasswordFormField(),
              ActionText(
                  function: () {
                    goto(context: context, screen: const Center());
                  },
                  question: 'Forget Password?'),
              CustomBTN(color: secondaryColor, function: () {}, text: 'LOGIN'),
              ActionText(
                  function: () {
                    goto(context: context, screen: const RegisterOptions());
                  },
                  question: 'Don\'t have an account?'),
            ],
          ),
        ),
      ),
    );
  }
}
