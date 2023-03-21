import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_model/controller/user_prefernces/user_prefernces_view_model.dart';

class SplashServices {
  UserPreferences userPreferences = UserPreferences();

  void isLogin() {
    userPreferences.getUser().then((value) {
      if (kDebugMode) {
        print(value.key);
      }
      if (value.key!.isEmpty || value.key.toString() == "null") {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesNames.loginView));
      } else {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesNames.homeView));
      }
    });
    Timer(const Duration(seconds: 3), () => Get.toNamed(RoutesNames.loginView));
  }
}
