import 'package:flutter/material.dart';

class AppColors {
  static const c212121 = Color(0xFF212121);
  static const c828282 = Color(0xFF828282);
  static const c9100F7 = Color(0xFF9100F7);
  static const cBDBDBD = Color(0xFFBDBDBD);
  static const c8B42FF = Color(0xFF8B42FF);
  static const cF9F9F9 = Color(0xFFEEEEEE);
  static const c7427F2 = Color(0xFF7427F2);
  static const cE0E0E0 = Color(0xFFE0E0E0);
  static const c2F80ED = Color(0xFF2F80ED);
  static const cF2F2F2 = Color(0xFFF2F2F2);
  static const c6CCA51 = Color(0xFF6CCA51);
}

class AppStyles {

  static const font12 = TextStyle(
    fontSize: 12,
    color: AppColors.c828282,
    fontFamily: 'Gilroy',
  );

  static const font15 = TextStyle(
    fontSize: 15,
    color: AppColors.c828282,
    fontFamily: 'Gilroy',
  );

  static const font10 = TextStyle(
    fontSize: 10,
    color: AppColors.c9100F7,
    fontFamily: 'Gilroy',
  );

  static const font14 = TextStyle(
    fontSize: 14,
    color: AppColors.c212121,
    fontFamily: 'Gilroy',
  );

  static const buttonTextStyle = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontFamily: 'Gilroy',
  );

  static const font16 = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontFamily: 'Gilroy',
  );

  static const inputBorderDecoration = InputDecoration(
    contentPadding: EdgeInsets.only(bottom: 8, top: 8,),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.c8B42FF)),
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.cBDBDBD)),
  );
}

ThemeData appTheme(BuildContext context) {
  final theme = Theme.of(context);
  return ThemeData(
    primarySwatch: Colors.blue,
    cursorColor: AppColors.c212121,
  );
}