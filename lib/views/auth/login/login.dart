import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/constants.dart';
import 'package:sindion/assets/functions.dart';
import 'package:sindion/assets/my_theme.dart';
import 'package:sindion/assets/widgets/custom_btn.dart';
import 'package:sindion/assets/widgets/loading.dart';
import 'package:sindion/view_model/auth.dart';
import 'package:sindion/views/auth/login/widgets/password_field.dart';
import 'package:sindion/views/auth/register/options/options.dart';
import 'package:sindion/views/auth/validators.dart';
import 'package:sindion/views/auth/widgets/action_text.dart';
import 'package:sindion/views/auth/widgets/field_label.dart';
import 'package:sindion/views/auth/widgets/form_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userNameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    userNameCont.dispose();
    passwordCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthVM authProvider = Provider.of(context);
    return Scaffold(
      body: authProvider.isLoading
          ? Loading()
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Constants.loginIMG),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit,eiusmod tempor',
                          style: TextStyle(
                              color: primaryColor.withOpacity(.5),
                              fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomFormField(
                            label: "User name",
                            hint: 'Enter your user name',
                            controller: userNameCont,
                            validator: (String value) {
                              return AuthValidators.validateName(value);
                            },
                            icon: Icons.person),
                        const FormFieldLabel(text: "Password"),
                        PasswordFormField(cont: passwordCont),
                        ActionText(
                            function: () {
                              //  goto(context: context, screen: const Center());
                            },
                            question: 'Forget Password?'),
                        CustomBTN(
                            color: primaryColor,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                authProvider.login(
                                    context: context,
                                    password: passwordCont.text,
                                    userName: userNameCont.text);
                              }
                            },
                            text: 'LOGIN'),
                        ActionText(
                            function: () {
                              goto(
                                  context: context,
                                  screen: const RegisterOptions());
                            },
                            question: 'Don\'t have an account?'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
