import 'package:flutter/material.dart';

class AppDimensions {
  static const double size2 = 2;
  static const double size5 = 5;
  static const double size10 = 10;
  static const double size14 = 14;
  static const double size20 = 20;
  static const double size50 = 50;

  static double widthDevice(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double heightDevice(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double verticalDevice(BuildContext context) =>
      MediaQuery.viewPaddingOf(context).vertical;

  static double horizontalDevice(BuildContext context) =>
      MediaQuery.viewPaddingOf(context).horizontal;

  static double topDevice(BuildContext context) =>
      MediaQuery.viewPaddingOf(context).top;

  static double bottomDevice(BuildContext context) =>
      MediaQuery.viewPaddingOf(context).bottom;
}
