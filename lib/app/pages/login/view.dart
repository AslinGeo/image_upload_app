import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:support_app/app/constants/app.colors.dart';
import 'package:support_app/app/constants/app.fonts.dart';
import 'package:support_app/app/pages/login/controller.dart';

class LoginView extends GetResponsiveView<LoginController> {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.center,
            child: Image(
              height: 320,
              width: 225,
              image: AssetImage("assets/images/login_image.png"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          textFormField(controller.usernameController, "Username"),
          const SizedBox(
            height: 10,
          ),
          textFormField(controller.passwordController, "Password"),
          const SizedBox(
            height: 10,
          ),
          loginButton(),
          const SizedBox(
            height: 60,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "For Assistance & Login Details Contact: ",
              style: AppFonts.textStyle.copyWith(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          contactText("English, Kannada & Telugu : ", "7406333800"),
          const SizedBox(
            height: 5,
          ),
          contactText("English, Kannada & Hindi  : ", "9071386515"),
          const SizedBox(
            height: 70,
          ),
          bottomVersionText()
        ],
      ),
    );
  }

  textFormField(TextEditingController textController, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: textController,
        obscureText: false,
        decoration: InputDecoration(
            hintStyle:
                AppFonts.hintStyle.copyWith(color: AppColors.piccadillyGrey),
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
                  const BorderSide(width: 1, color: AppColors.shadeGrey),
            ),
            border: InputBorder.none),
        style: AppFonts.hintStyle.copyWith(color: Colors.black),
        cursorColor: AppColors.primaryColor,
      ),
    );
  }

  loginButton() {
    return Container(
      decoration: BoxDecoration(
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
      child: ElevatedButton(
        onPressed: () {
          controller.login();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style:
                    AppFonts.headingStyle.copyWith(color: AppColors.appWhite),
              ),
            ],
          ),
        ),
      ),
    );
  }

  contactText(text, contactNumber) {
    return Row(
      children: [
        Text(
          text,
          style: AppFonts.textStyle.copyWith(color: Colors.black),
        ),
        Text(
          contactNumber,
          style: AppFonts.mediumTextStyle.copyWith(
            color: AppColors.primaryColor,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryColor,
          ),
        )
      ],
    );
  }

  bottomVersionText() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Text(
            "v1.7© 2023,Codeland Infosolutions Pvt Ltd.",
            style: AppFonts.regularTextStyle.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
