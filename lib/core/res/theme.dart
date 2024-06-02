import 'package:flutter/material.dart';
import 'package:flutter_news_app/core/res/colors.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: const Color(0xFFF9F9F9),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF9F9F9),
    ),
    fontFamily: 'SF-Pro-Display',
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: ColorsUI.textBlackColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    ),
  );
}
