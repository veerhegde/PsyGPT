import 'package:flutter/material.dart';

import '../widgets/personality_test_content.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MindqTest111(),
    );
  }
}
class MindqTest111 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildPersonalityTestWidget(
          questions: [

            Question(
            text: "Spending time with others or alone?",
            options: ["Always with others.", "Mostly with others.", "It depends.", "Mostly alone.", "Always alone."],
            lottieAnimationUrl: "https://lottie.host/8ef36c39-7b7c-43fb-bff9-f5864f5a10d8/OxcSr390OG.json",
            ),
            Question(
              text: "What do you focus on more?",
              options: ["Every little detail.", "Mostly the details.", "Both equally.", "Mostly the big picture.", "Only the big picture."],
              lottieAnimationUrl: "https://lottie.host/e487425f-5ce4-4133-a356-901b4d1cdc78/lOiylY7Icn.json",
            ),
            Question(
                text: "How do you make decisions?",
                options: ["Purely logical.", "Mostly logical.", "Balanced logic and emotions.", "Mostly emotional.", "Purely emotional."],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),

            Question(
                text: "Plans or spontaneity?",
                options: ["Love detailed plans.", "Prefer some structure.", "Flexible, either works.", "Prefer going with the flow.", "Avoid plans entirely."],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),

            Question(
                text: "Do you enjoy learning new things?",
                options: ["Always excited to learn.", "Often enjoy learning.", "Neutral about it.", "Rarely seek new experiences.", "Not excited to learn."],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),

            Question(
                text: "Do you trust your intuition?",
                options: ["Always trust it.", "Trust it often.", "Neutral about it.", "Rarely trust it.", "Don’t trust it at all."],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),

            Question(
                text: "How important is productivity?",
                options: ["Very important every day.", "Important most of the time.", "Neutral about it.", "Prefer a relaxed pace.", "Not important at all."],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),

            Question(
                text: "How empathic are you?",
                options: ["Deeply empathic always.", "Empathic most of the time.", "Neutral about it.", "Rarely empathic.", "Not empathic at all."],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),

            Question(
                text: "How do you feel about spontaneity?",
                options: ["Love improvising.", "Enjoy it often.", "Neutral about it.", "Prefer plans.", "Avoid spontaneity."],
                lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
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
