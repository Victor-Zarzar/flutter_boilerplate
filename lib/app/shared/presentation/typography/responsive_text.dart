import 'package:flutter/material.dart';

class ResponsiveText {
  static double getSize(BuildContext context, double size) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double scaleFactor = screenWidth / 375;

    return (size * scaleFactor).clamp(size * 0.8, size * 1.4);
  }
}
