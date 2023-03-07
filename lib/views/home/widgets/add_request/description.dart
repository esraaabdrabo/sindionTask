import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/my_theme.dart';
import '../../../animation/obacity.dart';

class AddRequestDescription extends StatelessWidget {
  const AddRequestDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
        color: primaryColor.withOpacity(.05),
        height: 17.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimateObacity(
              duration: const Duration(seconds: 1),
              isForward: true,
              curve: Curves.bounceInOut,
              widget: Text(
                'Add Request',
                style: MyThemeData.titleTS,
              ),
            ),
            SizedBox(
              height: 1.25.h,
            ),
            AnimateObacity(
                duration: const Duration(seconds: 2),
                isForward: true,
                curve: Curves.bounceInOut,
                widget: Text(
                  'Lorem ipsum dolor sit amet,sunt in culpa qui officia Lorem .',
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: MyThemeData.subTitleTS,
                ))
          ],
        ),
      ),
    );
  }
}
