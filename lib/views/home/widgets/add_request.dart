import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/utils/functions.dart';
import 'package:sindion/views/home/widgets/add_request/description.dart';
import 'package:sindion/views/home/widgets/add_request/wallet.dart';
import '../../../assets/widgets/custom_btn.dart';
import '../../../utils/my_theme.dart';


class AddRequest extends StatelessWidget {
  const AddRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 27.h,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          const AddRequestDescription(),
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: SizedBox(
              width: 65.w,
              child: CustomBTN(
                  color: secodaryColor,
                  function: () {
                    showSnackBar(
                        context: context, text: 'Request now button pressed');
                  },
                  text: 'Request Now!'.toUpperCase()),
            ),
          ),
          const AddRequestWallet()
        ],
      ),
    );
  }
}
