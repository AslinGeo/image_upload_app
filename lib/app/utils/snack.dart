import 'dart:ui';

import 'package:get/get.dart';
import 'package:support_app/app/constants/app.colors.dart';

class SnackbarUtils {
  static final _singleton = SnackbarUtils();
  static SnackbarUtils get instance => _singleton;

  successSnackbar(String msg) {
    normalSnackBar(msg, color: AppColors.colorSuccess);
  }

  failureSnackbar(String msg, {bool isTop = true}) {
    normalSnackBar(msg, color: AppColors.colorFailure, isTop: isTop);
  }

  normalSnackBar(String msg, {Color? color, bool isTop = true}) {
    Get.showSnackbar(
      GetSnackBar(
        message: msg,
        backgroundColor: color ?? const Color(0xFF303030),
        duration: const Duration(seconds: 2),
        snackPosition: isTop ? SnackPosition.TOP : SnackPosition.BOTTOM,
      ),
    );
  }
}
