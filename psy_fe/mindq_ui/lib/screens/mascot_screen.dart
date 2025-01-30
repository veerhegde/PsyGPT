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
          image: DecorationImage(
            image: AssetImage('lib/assets/reg_logo.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF471554),
              Color(0xFFEF7822),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 40),
            Center(
              child: Image.asset(
                'lib/assets/phobe-removebg-preview.png',
                height: 250,
              ),
            ),

            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
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
                      color: Color(0xFFEFD377).withOpacity(0.8),
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
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF9C3FE4),
                          Color(0xFFC65647),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.4), // Shadow color
                          spreadRadius: 2, // How much the shadow spreads
                          blurRadius: 10, // Blur effect
                          offset: Offset(4, 4), // X and Y offset
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Your button action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // Make button background transparent
                        shadowColor: Colors.transparent, // Remove default shadow
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Lets do this",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Ensure text is visible on gradient
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}