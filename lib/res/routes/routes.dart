import 'package:get/get.dart';
import 'package:getx_mvvm/view/login_view.dart';
import 'package:getx_mvvm/view/splash_view.dart';

import 'routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesNames.splashScreen,
            page: () => const SplashView(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RoutesNames.loginScreen,
            page: () => const LoginView(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
      ];
}
