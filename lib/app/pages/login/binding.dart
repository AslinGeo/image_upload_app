import 'package:get/get.dart';
import 'package:support_app/app/pages/login/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}