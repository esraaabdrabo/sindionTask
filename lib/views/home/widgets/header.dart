import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_theme.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    Constants.buildingIMG,
                  ),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.w),
                  bottomRight: Radius.circular(15.w))),
          height: 35.h,
          width: 100.w,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(122, 0, 0, 0),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.w),
                    bottomRight: Radius.circular(15.w))),
            child: Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                "QAYM AQARAK",
                style: GoogleFonts.cairo(
                    letterSpacing: 2,
                    fontWeight: FontWeight.w900,
                    fontSize: 25.sp,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.w),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 5.w,
            child: Icon(
              Icons.menu,
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
