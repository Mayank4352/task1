import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controllers/time_controller.dart';

class TimeBasedBackground extends GetView<TimeBackgroundController> {
  const TimeBasedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: orientation == Orientation.portrait ? 70.h : 100.h,
              child: Obx(() {
                final imagePath = controller.currentImage.value;
                if (imagePath == null) return const SizedBox.shrink();

                return AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: Container(
                    key: ValueKey<String>(imagePath),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
            ),
            Positioned.fill(
              top: orientation == Orientation.portrait ? 30.h : 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.9),
                      Colors.black,
                    ],
                    stops: const [0.0, 0.3, 0.6, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
