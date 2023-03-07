import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/widgets/custom_btn.dart';

import 'my_theme.dart';

goto({required BuildContext context, required Widget screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

gotoReplacement({required BuildContext context, required Widget screen}) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => screen));
}

showSnackBar({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: primaryColor,
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: MyThemeData.white18,
      )));
}

showAlertDialog(
    {required BuildContext context,
    required Function() yesFunction,
    required String title}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: MyThemeData.titleTS,
      ),
      actions: [
        SizedBox(
            width: 25.w,
            child: Padding(
              padding: EdgeInsets.all(2.w),
              child: CustomBTN(
                  color: const Color.fromARGB(183, 244, 67, 54),
                  function: yesFunction,
                  text: "Yes"),
            )),
        SizedBox(
          width: 25.w,
          child: Padding(
            padding: EdgeInsets.all(2.w),
            child: CustomBTN(
                color: primaryColor,
                function: () {
                  Navigator.pop(context);
                },
                text: "No"),
          ),
        )
      ],
    ),
  );
}
