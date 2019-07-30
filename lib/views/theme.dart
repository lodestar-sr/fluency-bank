import 'package:flutter/material.dart';

class AppColors {
  static const textColor = Color(0xFF212121);
  static const grayColor = Color(0xFF828282);
  static const purpleColor = Color(0xFF9100F7);
  static const underlineColor = Color(0xFFBDBDBD);
  static const activeUnderlineColor = Color(0xFF8B42FF);
}

class AppStyles {

  static const stepTextStyle = TextStyle(
    fontSize: 12,
    color: AppColors.grayColor,
    fontFamily: 'Gilroy',
  );

  static const titleGrayStyle = TextStyle(
    fontSize: 15,
    color: AppColors.grayColor,
    fontFamily: 'Gilroy',
  );

  static const inputLabelStyle = TextStyle(
    fontSize: 10,
    color: AppColors.purpleColor,
    fontFamily: 'Gilroy',
  );

  static const inputTextStyle = TextStyle(
    fontSize: 14,
    color: AppColors.textColor,
    fontFamily: 'Gilroy',
  );

  static const buttonTextStyle = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontFamily: 'Gilroy',
  );
}

ThemeData appTheme(BuildContext context) {
  final theme = Theme.of(context);
  return ThemeData(
    primarySwatch: Colors.blue,
    cursorColor: AppColors.textColor,
  );
}