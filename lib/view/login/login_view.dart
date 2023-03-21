import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_model/controller/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formkey = GlobalKey<FormState>();
  LoginViewModel loginController = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Login Api")),
        backgroundColor: const Color.fromARGB(255, 102, 100, 100),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar("Email", "Please Enter Email");
                        }
                        return null;
                      },
                      controller: loginController.emailController.value,
                      focusNode: loginController.emailFocusNode.value,
                      onFieldSubmitted: (value) {
                        Utils.feildFocusChange(
                            context,
                            loginController.emailFocusNode.value,
                            loginController.passFocusNode.value);
                      },
                      decoration: InputDecoration(
                          hintText: "email_hint".tr,
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.email)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar("Password", "Please Enter Password");
                        }
                        return null;
                      },
                      controller: loginController.passwordController.value,
                      focusNode: loginController.passFocusNode.value,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "password_hint".tr,
                          prefixIcon: const Icon(Icons.lock)),
                    ),
                  ],
                )),
            const SizedBox(
              height: 40,
            ),
            Obx(() => RoundButton(
                  loading: loginController.loading.value,
                  onpress: () {
                    if (formkey.currentState!.validate()) {
                      loginController.loginApi();
                    }
                  },
                  title: 'button_text'.tr,
                  width: 200,
                  buttonColor: const Color.fromARGB(255, 102, 100, 100),
                ))
          ],
        ),
      ),
    );
  }
}
