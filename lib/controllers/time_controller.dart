import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeBackgroundController extends GetxController {
  final Rxn<String> currentImage = Rxn<String>();
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    ever(currentImage, (callback) => debugPrint('Image updated to: $callback'));
    _updateBackgroundImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => _updateBackgroundImage(),
    );
  }

  void _updateBackgroundImage() {
    final now = DateTime.now();
    final hour = now.hour;

    String newImage;
    if (hour >= 6 && hour < 8) {
      newImage = 'assets/images/morning.jpeg';
    } else if (hour >= 8 && hour < 17) {
      newImage = 'assets/images/noon.jpg';
    } else if (hour >= 17 && hour < 19) {
      newImage = 'assets/images/bonfire.png';
    } else {
      newImage = 'assets/images/night.jpg';
    }

    if (currentImage.value != newImage) {
      currentImage.value = newImage;
      debugPrint(
          'Time: ${now.hour}:${now.minute}, Updated image to: $newImage');
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
