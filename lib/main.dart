import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stroll/views/widgets/bottom_nav_bar.dart';
import 'package:stroll/controllers/time_controller.dart';
import 'package:stroll/controllers/quote_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(TimeBackgroundController(), permanent: true);
  Get.put(QuoteController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: const MainNavigation(),
        );
      },
    );
  }
}
