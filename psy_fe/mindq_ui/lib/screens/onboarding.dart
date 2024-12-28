import 'package:flutter/material.dart';

import '../widgets/personality_test_content.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildPersonalityTestWidget(
          questions: [
            Question(
              text: "I enjoy spending time alone.",
              options: ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"],
              lottieAnimationUrl: "https://lottie.host/e830bc87-a72b-43df-85bc-3f6e373b4de0/PRUkGNSFsT.json",
            ),
            Question(
              text: "I prefer to work in a team.",
              options: ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"],
              lottieAnimationUrl: "https://lottie.host/e487425f-5ce4-4133-a356-901b4d1cdc78/lOiylY7Icn.json",
            ),
            Question(
              text: "I am comfortable with public speaking.",
              options: ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"],
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