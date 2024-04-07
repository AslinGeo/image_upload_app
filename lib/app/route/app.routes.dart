import 'package:get/get.dart';
import 'package:support_app/app/pages/home/binding.dart';
import 'package:support_app/app/pages/home/view.dart';
import 'package:support_app/app/pages/login/binding.dart';
import 'package:support_app/app/pages/login/view.dart';
import 'package:support_app/app/pages/splash/view.dart';
import 'package:support_app/app/route/app.pages.dart';

class AppRoute {
  AppRoute._();

  static List<GetPage<dynamic>> route = [
    GetPage(
      name: AppPages.splash,
      page: () => const SplashView(),
    ),
    GetPage(
        name: AppPages.login, page: () => LoginView(), binding: LoginBinding()),
    GetPage(
        name: AppPages.home, page: () => HomeView(), binding: HomeBinding()),
  ];
}
