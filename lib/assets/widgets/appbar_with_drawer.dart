import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/widgets/custom_drawer.dart';

createAppbarWithDrawer({required Function() logoutFunction}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: 100,
    leadingWidth: 25.w,
    leading: const CustomDrawer(),
    actions: [
      IconButton(
          onPressed: () {
            logoutFunction();
          },
          icon: const Icon(Icons.logout))
    ],
  );
}
