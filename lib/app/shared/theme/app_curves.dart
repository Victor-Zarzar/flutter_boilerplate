import 'package:flutter/material.dart';

abstract final class AppCurves {
  AppCurves._();

  static const Curve standard = Curves.easeInOut;
  static const Curve emphasized = Curves.easeInOutCubicEmphasized;
  static const Curve decelerate = Curves.decelerate;
  static const Curve accelerate = Curves.easeIn;
  static const Curve spring = Curves.elasticOut;
  static const Curve easeOutBack = Curves.easeOutBack;
  static const Curve linear = Curves.linear;
  static const Curve smooth = Curves.easeInOutCubic;
  static const Curve pageEnter = decelerate;
  static const Curve pageExit = accelerate;
  static const Curve popupOpen = emphasized;
  static const Curve popupClose = standard;
  static const Curve microInteraction = easeOutBack;
}
