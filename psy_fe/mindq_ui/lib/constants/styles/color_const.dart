import 'package:flutter/material.dart';

class ThemeColor {
  static Color appPrimaryBackground = Color(0xffb74093);
  static Color splashScreenText = Color(0xffc9832b);
  static Color appPrimaryColor = Color(0xfff4d738);
  static Color appPrimaryShadow = Color(0xffc10bff);
  static Color appBoxShadow = Color(0xffffffff);
  static Color filledColorBlack = Colors.red;
  static Color fieldbg = Color(0xff231F0B);
  static Color FormIconShade = Color(0xffA4A4A4);
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
  static Gradient LoginGradient = LinearGradient(
    colors: [
      Color(0xFF876A3B),
      Color(0xFF827228),
      Color(0xFF817227),
      Color(0xFF897928),
      Color(0xFFECD037),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}