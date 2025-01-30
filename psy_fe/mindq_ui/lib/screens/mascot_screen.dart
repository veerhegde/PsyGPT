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
            SizedBox(height: 9),
            Align(
              alignment: Alignment.topLeft, // Aligns the image to the left
              child: Image.asset(
                "lib/assets/Phoebe_mascot.png",
                width: 196, // Adjust width as needed
                height: 196, // Adjust height as needed
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 0),//padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/mascot_bg.png"), // Your image path
                  fit: BoxFit.cover, // Cover the entire container
                ),
                //color: Colors.white.withOpacity(0),
               // borderRadius: BorderRadius.only(
                 // topLeft: Radius.circular(30),
                 // topRight: Radius.circular(30),

                //),
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
      style: ThemeFont.primaryFont(fontSize: 40.33, fontWeight: FontWeight.bold),
    ),
      TextSpan(
        text: 'I am ',
      ),
    TextSpan(
    text: 'Phoebe',
    style: ThemeFont.secondaryFont().copyWith(fontSize: 40.33,
    fontStyle: FontStyle.italic,fontWeight: FontWeight.w900
    ),
    ),],),),
                  Text(
                    'welcome onboard!',
                    style: ThemeFont.primaryFont(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),



                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 90, vertical: 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("lib/assets/phoebe_msg_bg.png"), // Background image
                        fit: BoxFit.cover, // Full-screen fill
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Keeps the Column tight around its content
                      children: [
                        SizedBox(height: 126), // Spacing before text

                        // RichText with Text Shadow
                        RichText(
                          textAlign: TextAlign.center, // Ensures the text is centered
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
                              fontStyle: FontStyle.italic,color: Colors.white60,
                            ),
                          ),
                          TextSpan(
                            text: 'buddy, ',
                            style: ThemeFont.primaryFont(fontWeight: FontWeight.bold,color: Colors.white60,),
                          ),
                          TextSpan(
                            text: 'maybe even ',
                          ),
                          TextSpan(
                            text: 'partner-in-crime',
                            style: ThemeFont.secondaryFont().copyWith(
                              fontStyle: FontStyle.italic,color: Colors.white60,
                            ),
                          ),
                          TextSpan(
                            text: '!\n Since it’s our ',
                          ),
                          TextSpan(
                            text: 'first hangout',
                            style: ThemeFont.primaryFont(fontWeight: FontWeight.bold,color: Colors.white60,),
                          ),
                          TextSpan(
                            text: ', let’s get to\nknow your ',
                          ),
                          TextSpan(
                            text: 'vibe',
                            style: ThemeFont.secondaryFont().copyWith(
                              fontStyle: FontStyle.italic,color: Colors.white60,
                            ),),
                          TextSpan(
                            text: '—what makes you',
                          ),
                          TextSpan(
                            text: 'tick',
                            style: ThemeFont.secondaryFont().copyWith(
                              fontStyle: FontStyle.italic,color: Colors.white60,
                            ),
                          ),
                          TextSpan(
                            text: ',\n ',
                          ),
                          TextSpan(
                            text: 'groove',
                            style: ThemeFont.primaryFont(fontWeight: FontWeight.bold,color: Colors.white60,),
                          ),
                          TextSpan(
                            text: ', or go ',
                          ),
                          TextSpan(
                            text: '\'meh!\' ',
                            style: ThemeFont.secondaryFont().copyWith(
                              fontStyle: FontStyle.italic,color: Colors.white60,
                            ),
                          ),
                          TextSpan(
                            text: 'Sound ',
                          ),
                          TextSpan(
                            text: 'fun ',
                            style: ThemeFont.primaryFont(fontWeight: FontWeight.bold,color: Colors.white60,),
                          ),
                          TextSpan(
                            text: '?',
                          ),],
                        ),),

                        SizedBox(height:100), // Adds spacing before the divider

                        // Row with gradient dividers
                        Row(
                          children: [
                            // Left gradient divider
                            Expanded(
                              child: Container(
                                height: 1,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black26.withOpacity(0.0), // Transparent start
                                      Colors.black26, // Fully visible in the middle
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // Center text
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Continue to Test",
                                style: ThemeFont.primaryFont(
                                  fontSize: 14,
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
                                      Colors.black26.withOpacity(0.0), // Transparent end
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:10),
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
                          color: Colors.black.withOpacity(0.3), // Shadow color with opacity
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
                          color: Colors.white, // Ensure text is visible on gradient
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
    );
  }
}