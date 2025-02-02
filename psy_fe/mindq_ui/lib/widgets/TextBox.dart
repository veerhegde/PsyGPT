import 'package:flutter/material.dart';

class CustomTextbox extends StatefulWidget {
  final Color fillColor;
  final String labelText;
  final Color borderColor;
  bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final BoxConstraints? constraints;
  final Color textColor;
  final Color iconColor;
  final AlignmentGeometry gradientBegin;
  final AlignmentGeometry gradientEnd;
  final List<Color> gradientColors;
  final List<double>? gradientStops;
  final TextEditingController? controller;

  CustomTextbox({
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
    this.controller,
  }) : super(key: key);

  @override
  _CustomTextboxState createState() => _CustomTextboxState();
}

class _CustomTextboxState extends State<CustomTextbox> {
  late bool _isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: widget.constraints ?? BoxConstraints(),
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
            begin: widget.gradientBegin,
            end: widget.gradientEnd,
            colors: widget.gradientColors,
            stops: widget.gradientStops,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add padding
          child: TextField(
            controller: widget.controller,
            style: TextStyle(color: widget.textColor),
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: TextStyle(color: widget.textColor), // Set label color
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon, color: widget.iconColor)
                  : null,
              suffixIcon: widget.suffixIcon != null
                  ? GestureDetector(
                onTap: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                child: Icon(
                  _isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: widget.iconColor,
                ),
              )
                  : null,
              border: InputBorder.none, // Remove default border
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor, width: 2.0),
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor, width: 1.0),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            obscureText: _isPasswordVisible,
          ),
        ),
      ),
    );
  }
}