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
              text: "Okay, so... do you like hanging out with people more, or are you like, 'Nah, me time, please'?.",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/c47d9e9a-7db7-4289-8849-9f880144585c/4agQoMsOSN.lottie",
            ),
            Question(
              text: "When you're looking at something, are you more into all the tiny little details? Like, 'Ooh, look at this tiny thingymajig!' Or do you just go for the big picture?",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/e487425f-5ce4-4133-a356-901b4d1cdc78/lOiylY7Icn.json",
            ),
            Question(
              text: "When you're making decisions, are you like, ‘Let’s logic this out, Spock-style,’ or is it more like, ‘What feels right in my heart... or stomach?",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
            Question(
              text: "How do you feel about schedules? Like, are you the kind of person who’s got color-coded planners? Or are you more like, 'Whatever happens, happens'?",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/e830bc87-a72b-43df-85bc-3f6e373b4de0/PRUkGNSFsT.json",
            ),
            Question(
              text: "Ooh! Do you get excited about learning new things? Like, ‘I’m gonna learn how to make a birdhouse today!’ Or is that not your vibe?",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
            Question(
              text: "Do you ever get those moments where you're like, ‘I just know this is gonna happen,’ and then it does? Like psychic vibes? Oh, I love those!",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
            Question(
              text: "How important is getting things done quickly and perfectly to you? Like, are you all about efficiency, or do you stop and smell the roses?",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
            Question(
              text: "If someone’s feeling all sad or mopey, are you like, ‘Aww, tell me everything,’ or do you hand them a tissue and hope for the best?",
              options: ["Nope!", "Eh.", "Meh.", "Yep!", "Totally!"],
              lottieAnimationUrl: "https://lottie.host/d1f4a79c-0204-4a92-9f5f-d3d906ccdb28/e3QvqgNPR7.json",
            ),
            Question(
              text: "Okay, last one! Are you the kind of person who loves to just wing it and see what happens? Like, improvise! Woohoo! Or does that freak you out?",
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