import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';

class Question {
  final String text;
  final List<String> options;
  final String lottieAnimationUrl;

  Question({
    required this.text,
    required this.options,
    required this.lottieAnimationUrl,
  });
}

Widget buildPersonalityTestWidget({
  required List<Question> questions,
  required Function(int, double) onAnswerChanged,
  required Function() onTestComplete,
}) {
  return PersonalityTestContent(
    questions: questions,
    onAnswerChanged: onAnswerChanged,
    onTestComplete: onTestComplete,
  );
}

class PersonalityTestContent extends StatefulWidget {
  final List<Question> questions;
  final Function(int, double) onAnswerChanged;
  final Function() onTestComplete;

  const PersonalityTestContent({
    Key? key,
    required this.questions,
    required this.onAnswerChanged,
    required this.onTestComplete,
  }) : super(key: key);

  @override
  _PersonalityTestContentState createState() => _PersonalityTestContentState();
}

class _PersonalityTestContentState extends State<PersonalityTestContent>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final Map<int, double> _answers = {};
  final Map<int, AnimationController> _lottieControllers = {};
  final Map<int, PageController> _optionPageControllers = {};

  @override
  void initState() {
    super.initState();
    _initializeAnimationControllers();
  }

  void _initializeAnimationControllers() {
    for (int i = 0; i < widget.questions.length; i++) {
      _lottieControllers[i] = AnimationController(vsync: this);
      _optionPageControllers[i] = PageController(initialPage: 2); // Start at the middle option (Meh.)
    }
  }

  @override
  void dispose() {
    for (final controller in _lottieControllers.values) {
      controller.dispose();
    }
    _pageController.dispose();
    for (final controller in _optionPageControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF371942),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.questions.length,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 50), // Spacing at the top
                      Text(
                        widget.questions[index].text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: Center(
                          child: Container(
                            height: 250,
                            child: DotLottieLoader.fromNetwork(
                              widget.questions[index].lottieAnimationUrl,
                              frameBuilder: (ctx, dotLottie) {
                                if (dotLottie != null) {
                                  return Lottie.memory(
                                    dotLottie.animations.values.first,
                                    controller: _lottieControllers[index],
                                    onLoaded: (composition) {
                                      _lottieControllers[index]
                                        ?..duration = composition.duration
                                        ..value = 0.5;
                                    },
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                              errorBuilder: (ctx, e, s) {
                                print(s);
                                return Text(e.toString());
                              },
                            ),
                          ),
                        ),
                      ),
                      // Options with Carousel
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFEFD377).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              child: PageView.builder(
                                controller: _optionPageControllers[index],
                                itemCount: widget.questions[index].options.length,
                                onPageChanged: (optionIndex) {
                                  _updateAnswer(index, (optionIndex + 1).toDouble());
                                },
                                itemBuilder: (context, optionIndex) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Center(
                                      child: Text(
                                        widget.questions[index].options[optionIndex],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Swipe left or right. Choose card\nthat suits you best.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  ElevatedButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Previous",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Text(
                    "Q${_currentPage + 1} / ${widget.questions.length}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                // Next/Finish Button
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < widget.questions.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      widget.onTestComplete();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF771F92),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    _currentPage < widget.questions.length - 1
                        ? "Next"
                        : "Finish",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to update the answer and animation based on swipe
  void _updateAnswer(int index, double value) {
    setState(() {
      // Update the answer value, ensuring it stays within the 1-5 range
      _answers[index] = value;
    });
    _applySliderValueToAnimation(index);
  }

  void _applySliderValueToAnimation(int index) {
    double? value = _answers[index];
    if (value != null && _lottieControllers.containsKey(index)) {
      // Map the slider value (1-5) to animation progress (0-1)
      double progress = (value - 1) / 4;
      // Directly set the animation controller's value to the calculated progress
      _lottieControllers[index]!.value = progress;
    }
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildPersonalityTestWidget(
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