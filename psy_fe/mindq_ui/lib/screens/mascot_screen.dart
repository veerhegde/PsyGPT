import 'package:flutter/material.dart';
import '../constants/styles/font_const.dart';

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
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/login_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.overlay,
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
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              SizedBox(height: screenHeight * 0.05),
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              "lib/assets/Phoebe_mascot.png",
              width: screenWidth * 0.4,
              height: screenHeight * 0.25,
            ),
          ),
          // Welcome Text Container
          Container(
            padding: EdgeInsets.symmetric(vertical: 0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/mascot_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 15),
                RichText(
                  text: TextSpan(
                    style: ThemeFont.primaryFont(fontSize: 40.33),
                    children: [
                      TextSpan(
                        text: 'Hi! ',
                        style: ThemeFont.primaryFont(
                            fontSize: 40.33, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'I am ',
                      ),
                      TextSpan(
                        text: 'Phoebe',
                        style: ThemeFont.secondaryFont().copyWith(
                            fontSize: 40.33,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                Text(
                  'welcome onboard!',
                  style: ThemeFont.primaryFont(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 13.2),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/assets/phoebe_msg_bg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 126),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: ThemeFont.primaryFont(
                            fontSize: 19.6,
                            color: Colors.white60,
                          ),
                          children: [
                            TextSpan(text: 'I’ll be your'),
                            TextSpan(
                              text: ' guide, ',
                              style: ThemeFont.secondaryFont().copyWith(
                                fontStyle: FontStyle.italic,
                                color: Colors.white60,
                              ),
                            ),
                            TextSpan(
                              text: 'buddy, ',
                              style: ThemeFont.primaryFont(
                                fontWeight: FontWeight.bold,
                                color: Colors.white60,
                              ),
                            ),
                            TextSpan(
                              text: 'maybe even ',
                            ),
                            TextSpan(
                              text: 'partner-in-crime',
                              style: ThemeFont.secondaryFont().copyWith(
                                fontStyle: FontStyle.italic,
                                color: Colors.white60,
                              ),
                            ),
                            TextSpan(
                              text: '!\n Since it’s our ',
                            ),
                            TextSpan(
                              text: 'first hangout',
                              style: ThemeFont.primaryFont(
                                fontWeight: FontWeight.bold,
                                color: Colors.white60,
                              ),
                            ),
                            TextSpan(
                              text: ', let’s get to\nknow your ',
                            ),
                            TextSpan(
                              text: 'vibe',
                              style: ThemeFont.secondaryFont().copyWith(
                                fontStyle: FontStyle.italic,
                                color: Colors.white60,
                              ),
                            ),
                            TextSpan(
                              text: '—what makes you',
                            ),
                            TextSpan(
                              text: 'tick',
                              style: ThemeFont.secondaryFont().copyWith(
                                fontStyle: FontStyle.italic,
                                color: Colors.white60,
                              ),
                            ),
                            TextSpan(
                              text: ',\n ',
                            ),
                            TextSpan(
                              text: 'groove',
                              style: ThemeFont.primaryFont(
                                fontWeight: FontWeight.bold,
                                color: Colors.white60,
                              ),
                            ),
                            TextSpan(
                              text: ', or go ',
                            ),
                            TextSpan(
                              text: '\'meh!\' ',
                              style: ThemeFont.secondaryFont().copyWith(
                                fontStyle: FontStyle.italic,
                                color: Colors.white60,
                              ),
                            ),
                            TextSpan(
                              text: 'Sound ',
                            ),
                            TextSpan(
                              text: 'fun ',
                              style: ThemeFont.primaryFont(
                                fontWeight: FontWeight.bold,
                                color: Colors.white60,
                              ),
                            ),
                            TextSpan(
                              text: '?',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 100),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black26.withOpacity(0.0),
                                    Colors.black26,
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Continue to Test",
                              style: ThemeFont.primaryFont(
                                fontSize: 14,
                                color: Colors.black26,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black26,
                                    Colors.black26.withOpacity(0.0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF9C3FE4),
                        Color(0xFFC65647),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(4, 4),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/mindqtest');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Lets do this",
                      style: ThemeFont.primaryFont(
                        fontSize: 17.92,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
          ),
      ),
    ),
    );
  }
}