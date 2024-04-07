import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:support_app/app/constants/app.colors.dart';
import 'package:support_app/app/route/app.pages.dart';

class SplashView extends StatefulWidget {
  // ignore: use_super_parameters
  const SplashView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    preCacheWelcomeImages();
    Future.delayed(const Duration(seconds: 2), () async {
      Get.offNamed(AppPages.login);
    });
  }

  preCacheWelcomeImages() async {
    await precacheImage(
      const AssetImage("assets/images/logo.png"),
      context,
    );
    await precacheImage(
      const AssetImage("assets/images/login_image.png"),
      context,
    );
    await precacheImage(
      const AssetImage("assets/images/document_frame.png"),
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Image(
          height: 320,
          width: 225,
          image: AssetImage("assets/images/logo.png"),
        ),
      ),
    );
  }
}
