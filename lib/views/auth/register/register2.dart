import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/functions.dart';
import 'package:sindion/assets/my_theme.dart';
import 'package:sindion/assets/widgets/custom_btn.dart';
import 'package:sindion/assets/widgets/loading.dart';
import 'package:sindion/views/auth/widgets/drop_down_menu.dart';
import 'package:sindion/views/auth/widgets/form_field.dart';
import 'package:sindion/views/home/home.dart';
import '../../../assets/widgets/custom_appBar.dart';
import '../../../view_model/auth.dart';
import '../validators.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  TextEditingController userNameCont = TextEditingController();
  TextEditingController passwordcont = TextEditingController();
  TextEditingController countryCont = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameCont.dispose();
    passwordcont.dispose();
    countryCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthVM authProvider = Provider.of(context);

    return Scaffold(
      appBar: createCustomAppBar(),
      body: authProvider.isLoading
          ? const Loading()
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormField(
                          label: "User name",
                          hint: 'Enter your user name',
                          controller: userNameCont,
                          validator: (String value) {
                            return AuthValidators.validateName(value);
                          },
                          icon: Icons.person),
                      CustomFormField(
                          label: "Password",
                          hint: 'Enter your Password',
                          controller: passwordcont,
                          validator: (String value) {
                            return AuthValidators.validatePassword(value);
                          },
                          icon: Icons.remove_red_eye),
                      CustomDropDown(
                          function: (value) =>
                              authProvider.setCountry(country: value),
                          label: "Country",
                          options: const ['Egypt', ''],
                          hint: "Select your country",
                          icon: Icons.map),
                      CustomDropDown(
                          function: (value) {},
                          label: "Neighborood",
                          options: const ["Ss", "ss"],
                          hint: "Select your Neighborood",
                          icon: Icons.telegram_sharp),
                      Row(
                        children: [
                          Expanded(
                            child: CustomDropDown(
                                label: "City",
                                function: (value) {},
                                options: const ["Alex", "Cairo"],
                                hint: "City",
                                icon: Icons.telegram_sharp),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: CustomDropDown(
                                label: "Region",
                                function: (value) {},
                                options: const ["Ss", "ss"],
                                hint: "Region",
                                icon: Icons.telegram_sharp),
                          ),
                        ],
                      ),
                      CustomFormField(
                          label: "Detailed Address",
                          hint: 'Enter your detailed address',
                          controller: TextEditingController(),
                          validator: (String value) {},
                          icon: Icons.location_on_rounded),
                      CustomBTN(
                        color: primaryColor,
                        function: () {
                          if (formKey.currentState!.validate() &
                              (authProvider.user.country.isNotEmpty)) {
                            authProvider.setSecondUserData(
                              context: context,
                              userName: userNameCont.text,
                              password: passwordcont.text,
                            );
                          }
                        },
                        text: 'Finish',
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
