import 'package:flutter/material.dart';

class AppColors {
  static const c212121 = Color(0xFF212121);
  static const c828282 = Color(0xFF828282);
  static const c9100F7 = Color(0xFF9100F7);
  static const cBDBDBD = Color(0xFFBDBDBD);
  static const c8B42FF = Color(0xFF8B42FF);
  static const cF9F9F9 = Color(0xFFEEEEEE);
  static const c7427F2 = Color(0xFF7427F2);
}

class AppStyles {

  static const stepTextStyle = TextStyle(
    fontSize: 12,
    color: AppColors.c828282,
    fontFamily: 'Gilroy',
  );

  static const titleGrayStyle = TextStyle(
    fontSize: 15,
    color: AppColors.c828282,
    fontFamily: 'Gilroy',
  );

  static const inputLabelStyle = TextStyle(
    fontSize: 10,
    color: AppColors.c9100F7,
    fontFamily: 'Gilroy',
  );

  static const inputTextStyle = TextStyle(
    fontSize: 14,
    color: AppColors.c212121,
    fontFamily: 'Gilroy',
  );

  static const buttonTextStyle = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontFamily: 'Gilroy',
  );

  static const dialogTitleStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontFamily: 'Gilroy',
  );
}

ThemeData appTheme(BuildContext context) {
  final theme = Theme.of(context);
  return ThemeData(
    primarySwatch: Colors.blue,
    cursorColor: AppColors.c212121,
  );
}