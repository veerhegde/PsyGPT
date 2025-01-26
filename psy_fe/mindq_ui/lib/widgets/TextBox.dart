import 'package:flutter/material.dart';

class CustomTextbox extends StatelessWidget {
  final Color fillColor;
  final String labelText;
  final Color borderColor;
  final Color iconColor;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final BoxConstraints? constraints;
  final Color textColor;

  const CustomTextbox({
    Key? key,
    this.fillColor = Colors.white,
    required this.labelText,
    this.borderColor = Colors.black,
    this.iconColor = Colors.grey,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.constraints,
    this.textColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: constraints ?? BoxConstraints(),
      child: TextField(
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          labelText: labelText,
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: iconColor)
              : null,
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: iconColor)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
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
    );
  }
}