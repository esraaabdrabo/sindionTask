import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/my_theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.all(5.w),
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Icon(
          Icons.menu,
          color: primaryColor,
        ),
      ),
    );
  }
}
