import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../views/animation/size.dart';

class AnimatedImage extends StatelessWidget {
  final String path;
  const AnimatedImage({required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 35.h,
      child: AnimateSize(
          begin: 0,
          end: 35.h,
          isForward: true,
          curve: Curves.easeInCubic,
          duration: const Duration(seconds: 1),
          widget:
              SizedBox(width: 100.w, height: 35.h, child: Image.asset(path))),
    );
  }
}
