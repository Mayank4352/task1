class QuestionModel {
  final String question;
  final List<String> options;
  final String userAnswer;

  QuestionModel({
    required this.question,
    required this.options,
    this.userAnswer = '',
  });
}
