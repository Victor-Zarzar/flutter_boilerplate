import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class AppSpacing {
  AppSpacing._();

  static const double _xxs = 2;
  static const double _xs = 4;
  static const double _sm = 8;
  static const double _ms = 12;
  static const double _md = 16;
  static const double _ml = 20;
  static const double _lg = 24;
  static const double _xl = 32;
  static const double _xxl = 48;
  static const double _xxxl = 64;

  static double get xxs => _xxs.r;

  static double get xs => _xs.r;

  static double get sm => _sm.r;

  static double get ms => _ms.r;

  static double get md => _md.r;

  static double get ml => _ml.r;

  static double get lg => _lg.r;

  static double get xl => _xl.r;

  static double get xxl => _xxl.r;

  static double get xxxl => _xxxl.r;

  static double get pagePadding => md;

  static double get itemGap => sm;

  static double get cardPadding => md;

  static double get formFieldGap => ms;
}
