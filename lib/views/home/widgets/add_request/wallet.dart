import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/constants.dart';
import '../../../animation/offset.dart';

class AddRequestWallet extends StatelessWidget {
  const AddRequestWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimateOffset(
      begin: const Offset(1, 0),
      end: Offset.zero,
      duration: const Duration(seconds: 1),
      isForward: true,
      curve: Curves.fastOutSlowIn,
      widget: Align(
        alignment: Alignment.topRight,
        child: SizedBox(height: 12.h, child: Image.asset(Constants.walletIMG)),
      ),
    );
  }
}
