import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';

import '../constants/styles/font_const.dart';
import '../models/Questions.dart';



Widget buildPersonalityWidget({
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
      _optionPageControllers[i] = PageController(
        initialPage: 2,
        viewportFraction: 0.85,
      );
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
      decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage(
          'lib/assets/Quest2.png'),
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
                  padding: const EdgeInsets.only(top: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 40, right:40, top:60),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(44),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
                          child: Text(
                            widget.questions[index].text,
                            style: ThemeFont.primaryFont(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white60,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
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
                        height: 305,
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
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left:60, right:60, top:0, bottom: 120),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFAB8B38),
                                Color(0xFF9A7636),
                                Color(0xFFB8963C),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(44),
                            border: Border.all(
                              color: Colors.white60,
                              width: 9.6,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white60,
                                offset: Offset(0, 4),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                            color: const Color(0xfff4d738),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 100,
                                child: PageView.builder(
                                  controller: _optionPageControllers[index],
                                  itemCount: widget.questions[index].options.length,
                                  onPageChanged: (optionIndex) {
                                    _updateAnswer(index, (optionIndex + 1).toDouble());
                                  },
                                  itemBuilder: (context, optionIndex) {
                                    return Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Text(
                                          widget.questions[index].options[optionIndex],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /*Text(
                              'Swipe left or right. Choose the option\nthat represents you best.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white30.withOpacity(0),
                              ),
                            ),*/
                          ],
                        ),
                      ),
                    ],
                  ),
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

                if (_currentPage == 0)
                  SizedBox(width: 98),

                Text(
                  "Q${_currentPage + 1} / ${widget.questions.length}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white60,
                  ),
                ),

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