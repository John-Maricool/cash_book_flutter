import 'dart:async';

import 'package:cash_book/utils/constants/constants.dart';
import 'package:cash_book/utils/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.toNamed(USER_FIRST_TIME));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(child: Image.asset('assets/images/app_bg_white.png', width: 130, height: 45)));
  }
}
