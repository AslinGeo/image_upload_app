import 'package:get/get.dart';
import 'package:support_app/app/pages/home/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
