import 'package:get/get.dart';
import '../controllers/time_controller.dart';
import '../controllers/quote_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TimeBackgroundController(), permanent: true);
    Get.put(QuoteController(), permanent: true);
  }
}
