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
              text: "I prefer spending time with others over being alone..",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/8ef36c39-7b7c-43fb-bff9-f5864f5a10d8/OxcSr390OG.json",
            ),
            Question(
              text: "I focus more on the tiny details than the big picture.",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/e487425f-5ce4-4133-a356-901b4d1cdc78/lOiylY7Icn.json",
            ),
            Question(
              text: "I rely on logic more than feelings when making decisions.",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
            Question(
              text: "I feel comfortable with plans and schedules instead of going with the flow.",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/e830bc87-a72b-43df-85bc-3f6e373b4de0/PRUkGNSFsT.json",
            ),
            Question(
              text: "Learning new skills and trying new things excites me.",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
            Question(
              text: "I often have a strong sense of intuition about what’s going to happen.",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
            Question(
              text: "Being efficient and productive is very important to me.",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
            Question(
              text: "I empathize deeply with other people’s emotions.",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
            Question(
              text: "Okay, last one! I enjoy being spontaneous and improvising rather than sticking to a plan.",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
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