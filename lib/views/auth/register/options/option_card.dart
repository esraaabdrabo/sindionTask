import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/functions.dart';
import 'package:sindion/assets/widgets/custom_btn.dart';
import 'package:sindion/view_model/auth.dart';
import 'package:sindion/views/auth/register/options/data.dart';
import 'package:sindion/views/auth/register/register1.dart';
import '../../../../assets/my_theme.dart';

class OptionCard extends StatefulWidget {
  final int index;
  const OptionCard({required this.index, super.key});

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  Widget build(BuildContext context) {
    AuthVM authProvider = Provider.of(context);
    String userType = authProvider.user.userType;
    return InkWell(
      onTap: () => authProvider.setUserType(widget.index.toString()),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 2.w),
        decoration: BoxDecoration(
          color: const Color(0xfff8fafb),
          borderRadius: BorderRadius.circular(6.w),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 25.w,
              child: Image.asset(
                optionsData[widget.index]['img']!,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 3.w,
            ),
            SizedBox(
              width: 47.w,
              height: 10.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    optionsData[widget.index]['title']!,
                    style: GoogleFonts.aBeeZee(
                        fontWeight: FontWeight.w600,
                        color: secondaryColor,
                        fontSize: 18.sp),
                  ),
                  Text(
                    optionsData[widget.index]['subTitle']!,
                    style: GoogleFonts.aBeeZee(
                        color: secondaryColor.withOpacity(.8), fontSize: 16.sp),
                  )
                ],
              ),
            ),
            Radio<String>(
                activeColor: secondaryColor,
                value: '${widget.index}',
                groupValue: userType,
                onChanged: (value) {
                  authProvider.setUserType(widget.index.toString());
                }),
          ],
        ),
      ),
    );
  }
}