import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MascotWelcomePage(),
    );
  }
}

class MascotWelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF471554), // Dark purple
              Color(0xFFEF7822), // Orange
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 40), // Spacing at the top
            // Mascot Image
            Center(
              child: Image.asset(
                'lib/assets/image/mascot.png', // Replace with your mascot image path
                height: 250,
              ),
            ),

            // Welcome Text
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // Semi-transparent white
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Hi! I am Phoebe',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'welcome onboard!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      color: Color(0xFFEFD377).withOpacity(0.8), // Light yellow
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "I'll be your guide, buddy, maybe even partner-in-crime! Since it's our first hangout, let's get to know your vibe—what makes you tick, groove, or go 'meh!' Sound fun?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Continue to Test',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Continue Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle continue action
                    },
                    child: Text(
                      'Lets do this',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400], // Red button
                      padding:
                      EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Spacing at the bottom
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}