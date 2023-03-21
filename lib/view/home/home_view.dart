import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_model/controller/user_prefernces/user_prefernces_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserPreferences userPreferences = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                userPreferences.removeUser().then((value) {
                  Get.toNamed(RoutesNames.loginView);
                });
              },
              icon: const Icon(Icons.logout))
        ],
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Home")),
      ),
    );
  }
}
