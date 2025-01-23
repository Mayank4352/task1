import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stroll/views/widgets/questions_options.dart';
import 'package:stroll/views/widgets/user_quote.dart';
import '../../controllers/home_controller.dart';

class QuestionSection extends GetView<HomeController> {
  const QuestionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isPortrait = orientation == Orientation.portrait;

        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Center(child: UserQuote()),
              SizedBox(height: isPortrait ? 0.h : 1.h),
              Obx(() => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isPortrait ? 2 : 4,
                      crossAxisSpacing: isPortrait ? 2.w : 1.w,
                      mainAxisSpacing: isPortrait ? 1.h : 2.h,
                      childAspectRatio: isPortrait ? 0.6.w : 1.0,
                      mainAxisExtent: isPortrait ? null : 8.h,
                    ),
                    itemCount: controller.questions.first.options.length,
                    itemBuilder: (context, index) {
                      return Obx(() => QuestionOption(
                            optionText:
                                controller.questions.first.options[index],
                            isSelected:
                                controller.selectedOption.value == index,
                            onTap: () => controller.selectOption(index),
                            optionLetter: String.fromCharCode(65 + index),
                          ));
                    },
                  )),
            ],
          ),
        );
      },
    );
  }
}
