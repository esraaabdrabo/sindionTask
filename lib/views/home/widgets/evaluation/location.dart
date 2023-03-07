import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/my_theme.dart';

class EvaluationLocation extends StatelessWidget {
  const EvaluationLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.location_on,
          color: primaryColor.withOpacity(.5),
        ),
        Expanded(
          child: Text(
            "47 Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
            maxLines: 2,
            overflow: TextOverflow.clip,
            style: MyThemeData.subTitleTS.copyWith(fontSize: 15.sp),
          ),
        )
      ],
    );
  }
}
