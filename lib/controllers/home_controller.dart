import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stroll/model/question_model.dart';
import 'dart:async';

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

  final remainingTime = ''.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _updateTime();
    _timer = Timer.periodic(const Duration(minutes: 1), (_) => _updateTime());
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _updateTime() {
    final now = DateTime.now();
    final formatter = DateFormat('HH:mm');
    remainingTime.value = formatter.format(now);
  }

  void selectOption(int index) {
    if (selectedOption.value == index) {
      selectedOption.value = -1;
    } else {
      selectedOption.value = index;
    }
  }
}
