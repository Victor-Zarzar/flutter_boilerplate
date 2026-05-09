import 'package:flutter/material.dart';

abstract final class AppBorders {
  AppBorders._();

  static const BorderRadius xs = BorderRadius.all(Radius.circular(4));

  static const BorderRadius sm = BorderRadius.all(Radius.circular(8));

  static const BorderRadius md = BorderRadius.all(Radius.circular(12));

  static const BorderRadius lg = BorderRadius.all(Radius.circular(16));

  static const BorderRadius xl = BorderRadius.all(Radius.circular(24));

  static const BorderRadius bottomSheet = BorderRadius.vertical(
    top: Radius.circular(28),
  );

  static const BorderRadius full = BorderRadius.all(Radius.circular(999));

  static const BorderRadius button = lg;

  static const BorderRadius card = md;

  static const BorderRadius input = sm;

  static const BorderRadius dialog = xl;

  static const RoundedRectangleBorder shapeSm = RoundedRectangleBorder(
    borderRadius: sm,
  );

  static const RoundedRectangleBorder shapeMd = RoundedRectangleBorder(
    borderRadius: md,
  );

  static const RoundedRectangleBorder shapeLg = RoundedRectangleBorder(
    borderRadius: lg,
  );

  static const StadiumBorder stadium = StadiumBorder();
}
