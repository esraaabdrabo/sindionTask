import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/views/auth/validators.dart';
import '../../../../utils/my_theme.dart';
import '../../../animation/offset.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController cont;
  const PasswordFormField({required this.cont, super.key});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    return AnimateOffset(
        begin: const Offset(1, 0),
        end: Offset.zero,
        isForward: true,
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(seconds: 3),
        widget: TextFormField(
          obscureText: hidePass,
          controller: widget.cont,
          keyboardType: TextInputType.number,
          validator: (value) => AuthValidators.validatePassword(value!),
          decoration: InputDecoration(
              hintText: 'Enter your password',
              suffixIcon: InkWell(
                onTap: () {
                  hidePass = !hidePass;
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Icon(
                    hidePass ? Icons.remove_red_eye : Icons.lock,
                    color: const Color(0xffe5ecfc),
                  ),
                ),
              ),
              hintStyle: const TextStyle(color: Color(0xff72a2b8)),
              contentPadding: EdgeInsets.symmetric(vertical: 2.h),
              border: MyThemeData.borderRadius,
              enabledBorder: MyThemeData.borderRadius.copyWith(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(110, 114, 162, 184))),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: const Icon(
                  Icons.person,
                  color: Color(0xffe5ecfc),
                ),
              )),
        ));
  }
}
