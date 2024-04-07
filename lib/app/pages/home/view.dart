import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:support_app/app/constants/app.colors.dart';
import 'package:support_app/app/constants/app.fonts.dart';
import 'package:support_app/app/pages/home/controller.dart';

class HomeView extends GetResponsiveView<HomeController> {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.isView.value ? viewBody() : body()),
    );
  }

  viewBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(Get.context!).padding.top,
          ),
          AppBar(
            elevation: 0,
            backgroundColor: AppColors.appWhite,
            leading: InkWell(
                onTap: () {
                  controller.isView.value = false;
                },
                child: const Icon(Icons.arrow_back_ios)),
            centerTitle: true,
            title: Text(
              controller.selectedFileName.value,
              style: AppFonts.hintStyle.copyWith(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
              child: Image.file(File(controller.selectedFile.value!.path))),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  body() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(Get.context!).padding.top,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Upload  a  Image",
            style: AppFonts.hintStyle.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: DottedBorder(
              dashPattern: const [6, 6, 6, 6],
              borderType: BorderType.RRect,
              padding: const EdgeInsets.all(6),
              child: const ClipRRect(
                child: Center(
                  child: Image(
                    height: 100,
                    width: 100,
                    image: AssetImage("assets/images/document_frame.png"),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          bottomButtons(),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }

  bottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        button("Upload", AppColors.appWhite, AppColors.primaryColor),
        button("View", Colors.black, AppColors.nimbusCloud)
      ],
    );
  }

  button(String buttonText, Color textColor, Color backgroundColor) {
    return InkWell(
      onTap: () {
        if (buttonText == "Upload") {
          controller.pickFile();
        } else {
          controller.viewFile();
        }
      },
      child: Container(
        height: 35,
        width: 120,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonText,
            style: AppFonts.buttonTextStyle.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
