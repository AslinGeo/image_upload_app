import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:support_app/app/utils/snack.dart';

class HomeController extends GetxController {
  Rx<File?> selectedFile = Rx<File?>(null);
  RxBool isView = false.obs;
  RxString selectedFileName = "".obs;
  pickFile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? result = await picker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      File file = File(result.path);
      selectedFile.value = file;
      selectedFileName.value = result.name.toString();
    }
  }

  viewFile() {
    if (selectedFile.value == null) {
      SnackbarUtils.instance.failureSnackbar(
          "Image not available. Please upload an image.",
          isTop: false);
    } else {
      isView.value = true;
    }
  }
}
