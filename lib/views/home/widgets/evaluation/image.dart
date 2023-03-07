import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/constants.dart';

class EvaluationImage extends StatelessWidget {
  const EvaluationImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.w),
      child: SizedBox(
        width: 20.w,
        child: Image.asset(
          Constants.buildingIMG,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
