import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilWrapper extends StatelessWidget {
  final Widget child;
  final Size designSize;
  final bool minTextAdapt;
  final bool splitScreenMode;

  const ScreenUtilWrapper({
    super.key,
    required this.child,
    this.designSize = const Size(360, 690),
    this.minTextAdapt = true,
    this.splitScreenMode = true,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: minTextAdapt,
      splitScreenMode: splitScreenMode,
      builder: (context, _) => child,
    );
  }
}
