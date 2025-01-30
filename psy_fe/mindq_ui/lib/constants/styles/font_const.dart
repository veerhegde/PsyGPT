import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeFont {
  // Define your primary font style
  static TextStyle primaryFont({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 14.0,
  }) {
    return GoogleFonts.montserrat(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }

  // Define your secondary font style
  static TextStyle secondaryFont({
    Color color = Colors.grey,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 12.0,
  }) {
    return GoogleFonts.roboto(
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
