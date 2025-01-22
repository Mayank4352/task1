import 'package:get/get.dart';
import 'package:stroll/model/question_model.dart';

class HomeController extends GetxController {
  final questions = [
    QuestionModel(
      question: "What is your favorite time of the day?",
      options: [
        "The peace in the early mornings",
        "The magical golden hours",
        "Wind-down time after dinners",
        "The serenity past midnight",
      ],
    ),
  ].obs;

  final RxInt selectedOption = (-1).obs;

  void selectOption(int index) {
    if (selectedOption.value == index) {
      selectedOption.value = -1;
    } else {
      selectedOption.value = index;
    }
  }
}
