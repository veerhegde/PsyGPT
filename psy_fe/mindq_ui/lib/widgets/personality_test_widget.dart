import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';

import '../constants/styles/font_const.dart';
import '../models/Questions.dart';

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
      _lottieControllers[i] = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1), // Adjust duration
      );
      _optionPageControllers[i] = PageController(viewportFraction: 0.4);
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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/Quest2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0, -0.5),
                radius: 0.8,
                colors: [
                  const Color(0xFF371942).withOpacity(0.5),
                  Colors.transparent,
                ],
                stops: const [0.0, 1.0],
              ),
            ),
          ),
          Center(
            child: Column(
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
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.questions[index].text,
                            style: ThemeFont.primaryFont(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(44),
                                topRight: Radius.circular(44),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFFe0e0e0),
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
                            width: 600,
                            height: 240,
                            child: DotLottieLoader.fromNetwork(
                              widget.questions[index].lottieAnimationUrl,
                              frameBuilder: (ctx, dotLottie) {
                                if (dotLottie != null) {
                                  return Lottie.memory(
                                    dotLottie.animations.values.first,
                                    controller: _lottieControllers[index],
                                    onLoaded: (composition) {
                                      _lottieControllers[index]!.duration = composition.duration;
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
                          SizedBox(
                            height: 250,
                            child: PageView.builder(
                              controller: _optionPageControllers[index],
                              itemCount: widget.questions[index].options.length,
                              onPageChanged: (optionIndex) {
                                _updateAnswer(index, (optionIndex + 1).toDouble());
                              },
                              itemBuilder: (context, optionIndex) {
                                bool isSelected = (_answers[index] ?? -1) == (optionIndex + 1);
                                return Transform.scale(
                                  scale: isSelected ? 1.1 : 0.6,
                                  child: Container(
                                    height: 120,
                                    margin: const EdgeInsets.symmetric(vertical: 40),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFFAB8B38),
                                          Color(0xFF9A7636),
                                          Color(0xFFB8963C),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(44),
                                      border: isSelected
                                          ? Border.all(color: Colors.white60, width: 9.6)
                                          : null,
                                      boxShadow: isSelected
                                          ? const [
                                        BoxShadow(
                                          color: Colors.white60,
                                          offset: Offset(0, 4),
                                          blurRadius: 10,
                                          spreadRadius: 2,
                                        ),
                                      ]
                                          : null,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      widget.questions[index].options[optionIndex],
                                      style: ThemeFont.primaryFont(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.white.withOpacity(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentPage > 0)
                        Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF454045),
                          Color(0xFF2f2f2f), // Purple gradient start// Red gradient end
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // Transparent to allow gradient
                        shadowColor: Colors.transparent, // No default shadow
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        textStyle: ThemeFont.primaryFont(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Previous",
                        style: ThemeFont.primaryFont(color: Color(0xFF121212),fontWeight: FontWeight.bold),
                      ),

                          ),
                        ),
                if (_currentPage == 0) SizedBox(width: 98),

                Text(
                  "Q${_currentPage + 1} / ${widget.questions.length}",
                  style: ThemeFont.primaryFont(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: Colors.white60,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF771F92), // Purple
                        Color(0xFFC65647), // Red
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
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
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                        horizontal: 37,
                        vertical: 10,
                      ),
                      textStyle: ThemeFont.primaryFont(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      _currentPage < widget.questions.length - 1 ? "Next" : "Finish",
                      style: ThemeFont.primaryFont(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    ],),
    );
  }

  void _updateAnswer(int index, double value) {
    setState(() {
      _answers[index] = value;
    });
    _applySliderValueToAnimation(index);
  }

  void _applySliderValueToAnimation(int index) {
    double? value = _answers[index];
    if (value != null && _lottieControllers.containsKey(index)) {
      double progress = (value - 1) / 4;
      _lottieControllers[index]!.value = progress;
    }
  }
}