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

  @override
  void initState() {
    super.initState();
    _initializeAnimationControllers();
  }

  void _initializeAnimationControllers() {
    for (int i = 0; i < widget.questions.length; i++) {
      _lottieControllers[i] = AnimationController(vsync: this);
    }
  }

  @override
  void dispose() {
    for (final controller in _lottieControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image Container
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/pre_quest.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Foreground Content
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.questions.length,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Lottie Animation Container
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black, width: 2),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFFe0e0e0),
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
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
                                        ?..duration = composition.duration;
                                    },
                                  );
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              },
                              errorBuilder: (ctx, e, s) {
                                print(s);
                                return Text(e.toString());
                              },
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Question Text Container
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

                          // Answer Text Container
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
                              color: const Color(0xfff4d738),
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

                          // Slider
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
                              label: _getAnswerText(index),
                              onChanged: (double value) {
                                setState(() {
                                  _answers[index] = value;
                                });
                                _applySliderValueToAnimation(index);
                                widget.onAnswerChanged(index, value);
                              },
                              onChangeEnd: (double value) {},
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Bottom Navigation Container
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xfff4d738),
                  border: Border(
                    top: BorderSide(color: Colors.black, width: 2),
                    left: BorderSide(color: Colors.black, width: 2),
                    right: BorderSide(color: Colors.black, width: 2),
                    bottom: BorderSide(color: Colors.black, width: 2),
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
        ],
      ),
    );
  }

  void _applySliderValueToAnimation(int index) {
    double? value = _answers[index];
    if (value != null && _lottieControllers.containsKey(index)) {
      double progress = (value - 1) / 4;
      _lottieControllers[index]!.value = progress;
    }
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