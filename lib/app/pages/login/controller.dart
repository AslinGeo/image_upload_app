import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:support_app/app/route/app.pages.dart';
import 'package:support_app/app/utils/snack.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      Get.offAndToNamed(AppPages.home);
    } else {
      if (usernameController.text.isEmpty && passwordController.text.isEmpty) {
        SnackbarUtils.instance.failureSnackbar(
            "Please enter username and password",
            isTop: false);
      } else if (usernameController.text.isEmpty) {
        SnackbarUtils.instance
            .failureSnackbar("Please enter username", isTop: false);
      } else {
        SnackbarUtils.instance
            .failureSnackbar("Please enter password", isTop: false);
      }
    }
  }
}
