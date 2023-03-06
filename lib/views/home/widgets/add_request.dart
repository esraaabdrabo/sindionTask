import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../assets/my_theme.dart';
import '../../../assets/widgets/custom_btn.dart';

class AddRequest extends StatelessWidget {
  const AddRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 25.h,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2.w),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
              color: primaryColor.withOpacity(.05),
              height: 17.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Request',
                    style: MyThemeData.titleTS,
                  ),
                  SizedBox(
                    height: 1.25.h,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet,sunt in culpa qui officia Lorem .',
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: MyThemeData.subTitleTS,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: SizedBox(
              width: 65.w,
              child: CustomBTN(
                  color: secodaryColor,
                  function: () {},
                  text: 'Request Now!'.toUpperCase()),
            ),
          ),
          //wallet image not png
          /*  Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                      height: 12.h, child: Image.asset(Constants.walletIMG)),
                )*/
        ],
      ),
    );
  }
}
