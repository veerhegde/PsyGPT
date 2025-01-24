import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


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
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 619,
                  child: Lottie.network(
                    "https://lottie.host/36524179-6d79-4706-ad5a-c63ccce95318/InrUUm3QS9.json",
                  ),
                ),

                Positioned(
                  bottom: 30,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                    child:
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.getFont('Cardo', textStyle: const TextStyle(fontSize: 18.0, color: Colors.white)),
                        children: [
                          TextSpan(
                            text: 'Hi there! ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'my name is ',
                          ),

                          TextSpan(text: 'Phoebe\n', style: GoogleFonts.getFont('Montserrat', textStyle: const TextStyle(
                              color: Color(0xffb74093), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic
                          ))),
                          TextSpan(
                            text: 'I’ll be your ',
                          ),
                          TextSpan(
                            text: 'guide, ',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: 'buddy, ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'maybe even\nyour ',
                          ),

                          TextSpan(
                            text: 'partner-in-crime',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: '! Since it’s our ',
                          ),
                          TextSpan(
                            text: '\nfirst hangout',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ', let’s figure out',
                          ),
                          TextSpan(
                            text: ' what\nmakes you ',
                          ),
                          TextSpan(
                            text: 'tick',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: ', what ',
                          ),
                          TextSpan(
                            text: 'excites you',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' and\nwhat ',
                          ),
                          TextSpan(
                            text: 'doesn’t.\n',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: 'Ready? ',
                          ),
                          TextSpan(
                            text: 'Let’s dive in!',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
