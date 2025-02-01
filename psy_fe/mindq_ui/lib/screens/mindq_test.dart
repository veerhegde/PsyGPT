import 'package:flutter/material.dart';
import '../models/Questions.dart';
import '../widgets/personality_test_content.dart';
import '../widgets/personality_test_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MindqTest(),
    );
  }
}

class MindqTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildPersonalityWidget(
          questions: [
            Question(
              text: "Spending time with others or alone?",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl:
              "https://lottie.host/c47d9e9a-7db7-4289-8849-9f880144585c/4agQoMsOSN.lottie",
            ),
            Question(
              text: "Trying out new places or sticking to favorites?",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl:
              "https://lottie.host/e487425f-5ce4-4133-a356-901b4d1cdc78/lOiylY7Icn.json",
            ),
            Question(
              text: "Having deep, meaningful conversations or keeping it light and fun?",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl:
              "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
            Question(
              text: "Planning everything out or going with the flow?",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl:
              "https://lottie.host/e830bc87-a72b-43df-85bc-3f6e373b4de0/PRUkGNSFsT.json",
            ),
            Question(
              text: "Reading books, articles, news or watching TV, movies, social media?",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl:
              "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
            Question(
              text: "Following your heart or your head?",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl:
              "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
            Question(
              text: "Focusing on the small details or the big picture?",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl:
              "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
            Question(
              text: "Connecting with others’ feelings or offering practical help?",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl:
              "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
            Question(
              text: "Sticking to a plan or changing it up as you go?",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl:
              "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
          ],
          onAnswerChanged: (int questionIndex, double answerValue) {
            print("Question $questionIndex answered with value: $answerValue");
          },
          onTestComplete: () {
            print("Personality test completed!");
            Navigator.pushNamed(context, '/main');
          },
        ),
      ),
    );
  }
}