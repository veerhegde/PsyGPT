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
      backgroundColor: const Color(0xFFD8C2FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 350,
                  child: Lottie.network(
                    "https://lottie.host/36524179-6d79-4706-ad5a-c63ccce95318/InrUUm3QS9.json",
                  ),
                ),

                Positioned(
                  bottom: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                        text: 'Hi There!! my name is',
                        style: GoogleFonts.roboto(fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(text: 'Phoebe', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' text.'),
                        ],
                      ),
                    ),
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