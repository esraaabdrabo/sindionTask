import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/constants.dart';
import 'package:sindion/assets/my_theme.dart';
import 'package:sindion/assets/widgets/custom_btn.dart';
import 'package:sindion/views/home/widgets/add_request.dart';
import 'package:sindion/views/home/widgets/header.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_to_photos_rounded),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Header(),
              SizedBox(
                height: 5.h,
              ),
              const AddRequest(),
              
            ],
          )),
    );
  }
}
