import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'res/getx_localizations/languages.dart';
import 'res/routes/routes.dart';
import 'view/splashScreen/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Languages(),
      locale: const Locale("en", "US"),
      fallbackLocale: const Locale("en", "US"),
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const SplashView(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
