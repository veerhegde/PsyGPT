import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';

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
    Navigator.pushReplacementNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    print("SplashScreen build");
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Symbols.neurology,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 30),
            Text(
              'Mind Q',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Holistic Therapy',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 140),

            // Show loading indicator or button based on _isLoading
            if (_isLoading) ...[
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ] else ...[
              if (_showButton) // Show button only if _showButton is true
                ElevatedButton(
                  onPressed: _navigateToMain,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                  child: const Icon(Symbols.arrow_circle_right_rounded, size: 50,)
                ),
            ],

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}