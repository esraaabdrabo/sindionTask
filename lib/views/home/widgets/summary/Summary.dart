import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/views/home/widgets/summary/widgets/box.dart';
import '../../../../utils/my_theme.dart';

class EvaluationSummary extends StatelessWidget {
  const EvaluationSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SummaryBox(color: secodaryColor, number: '6', title: 'Pending'),
          SummaryBox(
              color: primaryColor.withOpacity(.5), number: '25', title: 'Done'),
          const SummaryBox(
              color: Color(0xfff27895), number: '1', title: 'Rejected'),
        ],
      ),
    );
  }
}
