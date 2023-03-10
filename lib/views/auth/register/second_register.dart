import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/widgets/custom_btn.dart';
import 'package:sindion/assets/widgets/loading.dart';
import 'package:sindion/utils/functions.dart';
import 'package:sindion/views/auth/widgets/drop_down_menu.dart';
import 'package:sindion/views/auth/widgets/form_field.dart';
import '../../../assets/widgets/custom_appBar.dart';
import '../../../utils/my_theme.dart';
import '../../../view_model/auth.dart';
import '../validators.dart';

class Register2 extends StatelessWidget {
  const Register2({super.key});

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
                  key: authProvider.formKey2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormField(
                          label: "User name",
                          hint: 'Enter your user name',
                          keyboardType: TextInputType.name,
                          controller: authProvider.userNameCont,
                          validator: (String value) {
                            return AuthValidators.validateName(value);
                          },
                          icon: Icons.person),
                      CustomFormField(
                          label: "Password",
                          hint: 'Enter your Password',
                          keyboardType: TextInputType.visiblePassword,
                          controller: authProvider.passwordcont,
                          validator: (String value) {
                            return AuthValidators.validatePassword(value);
                          },
                          icon: Icons.remove_red_eye),
                      CustomDropDown(
                          function: (value) =>
                              authProvider.setCountry(country: value),
                          label: "Country",
                          options: const ['Egypt'],
                          hint: "Select your country",
                          icon: Icons.map),
                      CustomDropDown(
                          function: (value) {},
                          label: "Neighborood",
                          options: const [" 1", " 2"],
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
                                icon: Icons.my_location_sharp),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: CustomDropDown(
                                label: "Region",
                                function: (value) {},
                                options: const [" 1", " 2"],
                                hint: "Region",
                                icon: Icons.location_searching_outlined),
                          ),
                        ],
                      ),
                      CustomFormField(
                          label: "Detailed Address",
                          hint: 'Enter your detailed address',
                          keyboardType: TextInputType.streetAddress,
                          controller: TextEditingController(),
                          validator: (String value) {},
                          icon: Icons.location_on_rounded),
                      CustomBTN(
                        color: primaryColor,
                        function: () {
                          if (authProvider.formKey2.currentState!.validate() &
                              (authProvider.user.country.isNotEmpty)) {
                            authProvider.setUserData(
                              context: context,
                            );
                          } else {
                            if (authProvider.user.country.isEmpty) {
                              showSnackBar(
                                  context: context,
                                  backGroundColor: Colors.red,
                                  text: "Please choose a country");
                            }
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
