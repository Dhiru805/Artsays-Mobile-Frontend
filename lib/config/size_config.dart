import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double designWidth;
  static late double designHeight;

  static void init(BuildContext context, {double? designW, double? designH}) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;

    designWidth = designW ?? 430;
    designHeight = designH ?? 932;
  }

  static double getWidth(double width) {
    return screenWidth * (width / designWidth);
  }

  static double getHeight(double height) {
    return screenHeight * (height / designHeight);
  }

  static double getFont(double fontSize) {
    return screenWidth * (fontSize / designWidth);
  }
}
