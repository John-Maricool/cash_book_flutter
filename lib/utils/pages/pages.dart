import 'package:cash_book/authentication/presentation/screens/input_number_page.dart';
import 'package:cash_book/authentication/presentation/screens/verify_number_page.dart';
import 'package:cash_book/user_first_time/intro_screen.dart';
import 'package:cash_book/utils/constants/routes.dart';
import 'package:get/get.dart';

final pages = [
  GetPage(
    name: USER_FIRST_TIME,
    page: () => IntroScreen(),
  ),
  GetPage(
    name: INPUT_NUMBER_PAGE,
    page: () => InputNumberPage(),
  ),
  GetPage(
    name: VERIFY_NUMBER_PAGE,
    page: () => VerifyNumberPage(),
  )
];
