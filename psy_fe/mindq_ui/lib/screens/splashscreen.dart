import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/styles/color_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true; // Flag to indicate loading state
  bool _showButton = false; // Flag to show the button

  @override
  void initState() {
    super.initState();
    print("SplashScreen initState");
    _loadData(); // Start loading data
  }

  // Simulate loading data
  Future<void> _loadData() async {
    print("Loading data...");
    await Future.delayed(const Duration(seconds: 3)); // Simulate a 3-second delay

    setState(() {
      _isLoading = false; // Data loading is complete
      _showButton = true;  // Show the button
    });

    print("Data loaded!");
  }

  void _navigateToMain() {
    print("Navigating to /main");
    Navigator.pushReplacementNamed(context, '/userauth');
  }

  @override
  Widget build(BuildContext context) {
    print("SplashScreen build");
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF887820),
                Color(0xFFF4D738),
                Color(0xFFF4D738),
                Color(0xFFFFD700),
                Color(0xFF887820),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('lib/assets/mq3.svg', width: 200, height: 400),
            const SizedBox(height: 9),
       Container(
      margin: const EdgeInsets.symmetric(horizontal: 44), // 20-pixel margins on either side
      padding: const EdgeInsets.all(5), // 20-pixel padding within the banner
      decoration: BoxDecoration(
      gradient: LinearGradient(
      colors: [
        Color(0XFFFEE24D),
        Color(0XFFF5DA41),
        Color(0XFFFFF25B),
        Color(0XFFF5DA41),
        Color(0XFFFEE24D),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(9), // Rounded corners
      ),

      child: Center(
      child: Text(
      'HOLISTIC THERAPY', // Banner text
      textAlign: TextAlign.center, // Center-align the text
      style: GoogleFonts.aboreto(
      fontSize: 16, // Font size
          fontWeight: FontWeight.w700,
          letterSpacing: 9, // Bold text
      color: ThemeColor.splashScreenText,
      ),
      ),
      ),
      ),
            const SizedBox(height: 140),
            if (_isLoading) ...[
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ] else ...[
              if (_showButton)
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ThemeColor.appBoxShadow.withOpacity(.6),
                        blurRadius: 20,
                        spreadRadius: 5,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _navigateToMain,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColor.appPrimaryBackground,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(44),
                      ),
                      shadowColor: ThemeColor.appBoxShadow.withOpacity(1),
                      elevation: 8,
                    ),
                    child: Icon(
                      Symbols.play_arrow,
                      size: 44,
                      color: ThemeColor.appPrimaryColor, // Icon color
                    ),
                  ),
                )

            ],

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}