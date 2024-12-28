import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// Data model for a question
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

// Helper function to build the Personality Test Widget
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

class _PersonalityTestContentState extends State<PersonalityTestContent> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final Map<int, double> _answers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 4,
          ),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(6, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.questions.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(3, 3),
                              ),
                            ],
                          ),
                          height: 250,
                          child: Lottie.network(
                            widget.questions[index].lottieAnimationUrl,
                            errorBuilder: (context, error, stacktrace) {
                              print("Lottie Error: $error");
                              print("Stacktrace: $stacktrace");
                              return Container(
                                color: Colors.grey,
                                child: const Center(
                                  child: Text("Error loading animation",
                                      style: TextStyle(color: Colors.black)),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(4, 4),
                              ),
                            ],
                            color: const Color(0xFFe0e0e0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.questions[index].text,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(4, 4),
                              ),
                            ],
                            color: const Color(0xFFe0e0e0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _getAnswerText(index),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: const Color(0xFF77dd77),
                            inactiveTrackColor: const Color(0xFFe0e0e0),
                            trackHeight: 5.0,
                            thumbColor: Colors.black,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 10.0,
                            ),
                            overlayColor: Colors.black.withAlpha(32),
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 18.0,
                            ),
                            valueIndicatorShape:
                            const PaddleSliderValueIndicatorShape(),
                            valueIndicatorColor: const Color(0xFF77dd77),
                            valueIndicatorTextStyle: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          child: Slider(
                            value: _answers[index] ?? 3,
                            min: 1,
                            max: 5,
                            divisions: 4,
                            label: _getAnswerText(
                                index), // Display option text as label
                            onChanged: (double value) {
                              setState(() {
                                _answers[index] = value;
                              });
                              widget.onAnswerChanged(index, value);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom Navigation Bar
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFe0e0e0),
                border: Border(
                    top: BorderSide(color: Colors.black, width: 2),
                    left: BorderSide(color: Colors.black, width: 2),
                    right: BorderSide(color: Colors.black, width: 2),
                    bottom: BorderSide(color: Colors.black, width: 2)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Question ${_currentPage + 1} of ${widget.questions.length}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage < widget.questions.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                        setState(() {
                          _currentPage++;
                        });
                      } else {
                        widget.onTestComplete();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF77dd77),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      shadowColor: Colors.black,
                      elevation: 4,
                    ),
                    child: Text(
                      _currentPage < widget.questions.length - 1
                          ? "Next"
                          : "Finish",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getAnswerText(int questionIndex) {
    double? value = _answers[questionIndex];
    if (value == null) {
      return widget.questions[questionIndex].options[2];
    }

    int index = (value - 1).round();
    return widget.questions[questionIndex].options[index];
  }
}