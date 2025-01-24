import 'package:flutter/material.dart';

class CustomTextbox extends StatelessWidget {
  final Color fillColor;
  final String labelText;
  final Color borderColor;
  final bool obscureText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  const CustomTextbox({
    Key? key,
    this.fillColor = Colors.white,
    required this.labelText,
    this.borderColor = Colors.black,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        labelText: labelText,
        prefixIcon: prefixIcon != null
            ? prefixIcon
            : null,
        suffixIcon: suffixIcon != null
            ? suffixIcon
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
    );
  }
}