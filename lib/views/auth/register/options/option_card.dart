import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/view_model/auth.dart';
import 'package:sindion/views/auth/register/options/data.dart';

import '../../../../utils/my_theme.dart';

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
          color: lightGrey,
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
                  Text(optionsData[widget.index]['title']!,
                      style: MyThemeData.titleTS),
                  Text(optionsData[widget.index]['subTitle']!,
                      style: MyThemeData.subTitleTS)
                ],
              ),
            ),
            Radio<String>(
                activeColor: primaryColor,
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
