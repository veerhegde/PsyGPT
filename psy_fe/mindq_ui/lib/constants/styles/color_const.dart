import 'package:flutter/material.dart';

class ThemeColor {
  static Color appPrimaryBackground = Color(0xffb74093);
  static Color splashScreenText = Color(0xffc9832b);
  static Color appPrimaryColor = Color(0xfff4d738);
  static Color appPrimaryShadow = Color(0xffc10bff);
  static Color appBoxShadow = Color(0xffffffff);
  static Color filledColorBlack = Colors.black;
  static Color FormIconShade = Colors.white24;
}

class ThemeGradient {
  static Gradient SplashGradient = LinearGradient(
    colors: [
      Color(0xFF887820),
      Color(0xFFF4D738),
      Color(0xFFF4D738),
      Color(0xFFFFD700),
      Color(0xFF887820),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}