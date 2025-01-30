import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeFont {
  // Define your primary font style
  static TextStyle primaryFont({
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 19.6,
  }) {
    return GoogleFonts.montserrat(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }

  // Define your secondary font style
  static TextStyle secondaryFont({
    Color color = Colors.white,
    fontStyle = FontStyle.italic,
    FontWeight fontWeight = FontWeight.w200,
    double fontSize = 19.6,
  }) {
    return GoogleFonts.montserrat(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }

  // Title font style
  static TextStyle titleFont({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.bold,
    double fontSize = 20.0,
  }) {
    return GoogleFonts.poppins(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }
}
