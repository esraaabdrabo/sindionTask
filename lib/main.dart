import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/utils/my_theme.dart';
import 'package:sindion/view_model/auth.dart';
import 'package:sindion/views/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (p0, p1, p2) => ChangeNotifierProvider(
            create: (context) => AuthVM(),
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: MyTheme.customTheme,
                home: const Splash())));
  }
}
