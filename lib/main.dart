import 'package:cash_book/user_first_time/splash_screen.dart';
import 'package:cash_book/utils/constants/constants.dart';
import 'package:cash_book/utils/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: pages,
      theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: backgroundColor),
      home: SplashScreen(),
    );
  }
}
