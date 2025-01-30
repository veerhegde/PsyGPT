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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/login_background.jpg'),
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
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft, // Aligns the image to the left
              child: Image.asset(
                "lib/assets/Phoebe_mascot.png",
                width: 190, // Adjust width as needed
                height: 190, // Adjust height as needed
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
                    style: ThemeFont.primaryFont(
                      fontSize: 40.33,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'welcome onboard!',
                    style: ThemeFont.primaryFont(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),


                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                    decoration: BoxDecoration(
                      color: Color(0xFFEFD377).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: ThemeFont.primaryFont(fontSize: 19.6),
                        children: [
                          TextSpan(
                            text: 'I’ll be your',
                          ),
                          TextSpan(
                            text: ' guide, ',
                            style: ThemeFont.secondaryFont().copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: 'buddy, ',
                            style: ThemeFont.primaryFont(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'maybe even ',
                          ),
                          TextSpan(
                            text: 'partner-in-crime',
                            style: ThemeFont.secondaryFont().copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: '!\n Since it’s our ',
                          ),
                          TextSpan(
                            text: 'first hangout',
                            style: ThemeFont.primaryFont(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ', let’s get to\nknow your ',
                          ),
                          TextSpan(
                            text: 'vibe',
                            style: ThemeFont.secondaryFont().copyWith(
                              fontStyle: FontStyle.italic,
                          ),),
                          TextSpan(
                            text: '—what makes you\n',
                          ),
                          TextSpan(
                            text: 'tick',
                            style: ThemeFont.secondaryFont().copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ', ',
                          ),
                          TextSpan(
                            text: 'groove',
                            style: ThemeFont.primaryFont(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ', or go ',
                          ),
                          TextSpan(
                            text: '\'meh!\' ',
                            style: ThemeFont.secondaryFont(fontStyle: FontStyle.italic).copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: 'Sound ',
                          ),
                          TextSpan(
                            text: 'fun ',
                            style: ThemeFont.primaryFont(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '?',
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      // Left gradient divider
                      Expanded(
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black26.withOpacity(0.0), // Start transparent
                                Colors.black26, // Fully visible in the middle
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
                            color: Colors.black26, // Text color
                            fontWeight: FontWeight.w500, // Text weight
                          ),
                        ),
                      ),
                      // Right gradient divider
                      Expanded(
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black26, // Fully visible in the middle
                                Colors.black26.withOpacity(0.0), // End transparent
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
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
                          color: Colors.pink.withOpacity(0.3), // Shadow color with opacity
                          offset: Offset(4, 4), // Horizontal and vertical shadow offset
                          blurRadius: 10, // How blurry the shadow is
                          spreadRadius: 2, // How far the shadow spreads
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
                        style: ThemeFont.primaryFont(
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