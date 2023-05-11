import 'package:cash_book/utils/constants/constants.dart';
import 'package:flutter/material.dart';

Widget defaultButtons(
    {required VoidCallback pressed,
    required String text,
    Size size = fullWidthButtonSize}) {
  return ElevatedButton(
      onPressed: pressed,
      style: ElevatedButton.styleFrom(
          primary: primaryColor, minimumSize: size, shadowColor: primaryColor),
      child: Text(
        text,
        style: const TextStyle(
            color: backgroundColor, fontSize: smallTextFontSize),
      ));
}
