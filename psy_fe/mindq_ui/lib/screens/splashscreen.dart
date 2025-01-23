import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      backgroundColor: Color(0xfff4d738),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('lib/assets/owl.svg', width: 300, height: 300,color: Color(0xffb74093)),
            Text(
              'MindQ',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 77, letterSpacing: 4.4,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),

            Text(
              'HOLISTIC THERAPY',
              style: GoogleFonts.aboreto(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 16,
                  color: Colors.black38,
                fontWeight: FontWeight.w700,
                  letterSpacing: 12
              ),
            ),

            const SizedBox(height: 140),

            if (_isLoading) ...[
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ] else ...[
              if (_showButton)
                ElevatedButton(
                  onPressed: _navigateToMain,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffb74093),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                  child: const Icon(Symbols.play_arrow, size: 44, color: Color(0xfff4d738),)
                ),
            ],

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}