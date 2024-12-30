class Question {
  final String text;
  final List<String> options;
  final String lottieAnimationUrl;

  Question({
    required this.text,
    required this.options,
    required this.lottieAnimationUrl,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      text: json['text'],
      options: List<String>.from(json['options']),
      lottieAnimationUrl: json['lottieAnimationUrl'],
    );
  }
}