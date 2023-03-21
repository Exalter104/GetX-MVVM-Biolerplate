import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repo.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_model/controller/user_prefernces/user_prefernces_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  UserPreferences userPreferences = UserPreferences();
  final emailFocusNode = FocusNode().obs;
  final passFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  void loginApi() {
    loading.value = true;
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text,
    };

    _api.loginApi(data).then((value) {
      loading.value = false;
      Utils.snackBar("Login", "Successfully");
      userPreferences.saveUser(UserModel.fromJson(value)).then((value) {
        Get.toNamed(RoutesNames.homeView);
      });
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}
