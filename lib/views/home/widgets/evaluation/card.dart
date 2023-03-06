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
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
      color: primaryColor.withOpacity(.035),
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
