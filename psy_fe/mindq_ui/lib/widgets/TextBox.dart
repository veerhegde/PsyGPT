import 'package:flutter/material.dart';

class CustomTextbox extends StatelessWidget {
  final Color fillColor;
  final String labelText;
  final Color borderColor;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final BoxConstraints? constraints;
  final Color textColor;
  final Color iconColor;
  final AlignmentGeometry gradientBegin;
  final AlignmentGeometry gradientEnd;
  final List<Color> gradientColors;
  final List<double>? gradientStops;

  const CustomTextbox({
    Key? key,
    required this.labelText,
    this.borderColor = Colors.black,
    this.obscureText = false,
    this.fillColor = Colors.black,
    this.prefixIcon,
    this.suffixIcon,
    this.constraints,
    this.textColor = Colors.black,
    this.iconColor = Colors.grey,
    this.gradientBegin = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
    this.gradientColors = const [
      Colors.black,
      Colors.black,
      Color(0xfffde900),
    ],
    this.gradientStops,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: constraints ?? BoxConstraints(),
      child: Container(
        decoration: BoxDecoration(
          color: fillColor,
          gradient: LinearGradient(
            begin: gradientBegin,
            end: gradientEnd,
            colors: gradientColors,
            stops: gradientStops,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            labelText: labelText,
            fillColor: fillColor,
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: iconColor)
                : null,
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: iconColor)
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 2.0),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1.0),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }
}