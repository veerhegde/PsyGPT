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
      home: TestOnboardingScreen(),
    );
  }
}

class TestOnboardingScreen extends StatefulWidget {
  @override
  _TestOnboardingScreenState createState() => _TestOnboardingScreenState();
}

class _TestOnboardingScreenState extends State<TestOnboardingScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/assets/pre_quest.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0, -0.5),
                radius: 0.8,
                colors: [
                  Color(0xFF371942).withOpacity(0.5),
                  Colors.transparent,
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 20),
                  child: Column(
                    children: [
                      Text(
                        '9 Questions',
                        style: ThemeFont.primaryFont(
                          fontSize: 40.33,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center, // Ensures the text is centered
                        text: TextSpan(
                          style: ThemeFont.primaryFont(
                            fontSize: 19.6,
                            color: Colors.white60,
                          ),
                          children: [
                            TextSpan(
                              text: 'to ',
                            ),
                            TextSpan(
                              text: 'personalize ',
                              style: ThemeFont.secondaryFont().copyWith(
                                fontStyle: FontStyle.italic,color: Colors.white60,
                              ),
                            ),
                            TextSpan(
                              text: 'a\n',
                            ),
                            TextSpan(
                              text: 'Therapeutic model\n',
                              style: ThemeFont.primaryFont(fontWeight: FontWeight.bold,color: Colors.white60,),
                            ),
                            TextSpan(
                              text: 'that ',
                            ),
                            TextSpan(
                              text: 'suits ',
                              style: ThemeFont.secondaryFont().copyWith(
                                fontStyle: FontStyle.italic,color: Colors.white60,
                              ),),
                            TextSpan(
                              text: 'you best!',
                            ),

                            ],

                        ),
                      ),
                      SizedBox(height: 123),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: RichText(
                    textAlign: TextAlign.center, // Ensures the text is centered
                    text: TextSpan(
                      style: ThemeFont.primaryFont(
                        fontSize: 19.6,
                        color: Colors.white60,
                      ),
                      children: [
                        TextSpan(
                          text: 'Be ',
                        ),
                        TextSpan(
                          text: 'mindful,',
                          style: ThemeFont.secondaryFont().copyWith(
                            fontStyle: FontStyle.italic,color: Colors.white60,
                          ),
                        ),
                        TextSpan(
                          text: ' choosing\n the appropriate option,',
                        ),
                        /*TextSpan(
                          text: 'accurate\n',
                          style: ThemeFont.secondaryFont().copyWith(
                            fontStyle: FontStyle.italic,color: Colors.white60,
                          ),),*/
                        TextSpan(
                          text: '\nin the ',
                        ),
                        TextSpan(
                          text: 'upcoming ',
                          style: ThemeFont.primaryFont(fontWeight: FontWeight.bold,color: Colors.white60,),
                        ),
                        TextSpan(
                          text: '\nquestionnaire.',
                        ),

                      ],

                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.purpleAccent),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Building Test',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.purpleAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}