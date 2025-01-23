import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controllers/quote_controller.dart';

class UserQuote extends GetView<QuoteController> {
  const UserQuote({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
          controller.userQuote.value,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
        ));
  }
}
