import 'package:flutter/material.dart';

class Sizes {
  // get screen width:
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // get screen height:
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Paddings:
  static const double largePadding = 30;
  static const double normalPadding = 20;
  static const double smallPadding = 10;
  static const double extraSmallPadding = 5;
}
