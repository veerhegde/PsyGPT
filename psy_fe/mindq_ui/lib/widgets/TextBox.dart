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
  final TextEditingController? controller; // Add controller property

  const CustomTextbox({
    Key? key,
    required this.labelText,
    this.borderColor = Colors.black,
    this.obscureText = false,
    this.fillColor = Colors.grey,
    this.prefixIcon,
    this.suffixIcon,
    this.constraints,
    this.textColor = Colors.white,
    this.iconColor = Colors.grey,
    this.gradientBegin = Alignment.topCenter,
    this.gradientEnd = Alignment.bottomCenter,
    this.gradientColors = const [
      Color(0xff151316),
      Color(0xff161306),
      Color(0xff2B250B),
    ],
    this.gradientStops,
    this.controller, // Add controller to constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: constraints ?? BoxConstraints(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/rectangle.png'),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.9),
              offset: Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.4),
              offset: Offset(0, 1),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
          gradient: LinearGradient(
            begin: gradientBegin,
            end: gradientEnd,
            colors: gradientColors,
            stops: gradientStops,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: controller, // Assign the controller to the TextField
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            labelText: labelText,
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