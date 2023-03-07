import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'title_status.dart';
import '../../../../utils/my_theme.dart';
import 'image.dart';
import 'location.dart';

class EvaluationCard extends StatelessWidget {
  const EvaluationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
          color: lightGrey,
          boxShadow: [
            BoxShadow(
                color: primaryColor.withOpacity(.1),
                blurRadius: 5,
                spreadRadius: 1)
          ]),
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
      child: Row(children: [
        const EvaluationImage(),
        SizedBox(
          width: 2.5.w,
        ),
        Expanded(
          child: Column(
            children: [
              const EvaluationTitleAndStatus(),
              SizedBox(
                height: 1.h,
              ),
              const EvaluationLocation()
            ],
          ),
        )
      ]),
    );
  }
}
