import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class StartOnboardingScreen extends StatefulWidget {
  const StartOnboardingScreen({Key? key}) : super(key: key);

  @override
  _StartOnboardingScreenState createState() => _StartOnboardingScreenState();
}

class _StartOnboardingScreenState extends State<StartOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4d738),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 550,
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
                        style: GoogleFonts.getFont('Cardo', textStyle: const TextStyle(fontSize: 18.0, color: Colors.)),
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
                            text: 'I’m your',
                          ),
                          TextSpan(
                            text: ' guide, ',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: 'buddy, ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'partner-in-crime',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: '!\n Sooo, since it’s our ',
                          ),
                          TextSpan(
                            text: 'first hangout',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ', let’s\nget to know your ',
                          ),
                          TextSpan(
                            text: 'vibe',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '—what makes you\n',
                          ),
                          TextSpan(
                            text: 'tick',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: ', ',
                          ),
                          TextSpan(
                            text: 'groove',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ', or go ',
                          ),
                          TextSpan(
                            text: '\'meh!\'',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: ' Sound fun? \n',
                          ),
                          TextSpan(
                            text: 'Let’s do this!',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' 😊🎸✨',
                          ),
                        ],
                      ),
                    )
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/onboarding');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF77dd77),
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                side: const BorderSide(color: Colors.black, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                shadowColor: Colors.black,
                elevation: 4,
              ),
              child: const Text(
                "Let's get started",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
