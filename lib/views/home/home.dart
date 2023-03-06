import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/utils/functions.dart';
import 'package:sindion/utils/my_theme.dart';
import 'package:sindion/views/home/widgets/Summary.dart';
import 'package:sindion/views/home/widgets/add_request.dart';
import 'package:sindion/views/home/widgets/evaluation/card.dart';
import 'package:sindion/views/home/widgets/header.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSnackBar(
              context: context, text: 'Floation action button pressed');
        },
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    EvaluationSummary(
                        color: secodaryColor, number: '6', title: 'Pending'),
                    EvaluationSummary(
                        color: primaryColor.withOpacity(.5),
                        number: '25',
                        title: 'Done'),
                    const EvaluationSummary(
                        color: Color(0xfff27895),
                        number: '1',
                        title: 'Rejected'),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) => const EvaluationCard()))
            ],
          )),
    );
  }
}
