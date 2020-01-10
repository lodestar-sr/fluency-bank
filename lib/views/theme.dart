import 'package:flutter/material.dart';

class AppColors {
  static const c212121 = Color(0xFF212121);
  static const c828282 = Color(0xFF828282);
  static const cBDBDBD = Color(0xFFBDBDBD);
  static const cF9F9F9 = Color(0xFFEEEEEE);
  static const cE0E0E0 = Color(0xFFE0E0E0);
  static const c2F80ED = Color(0xFF2F80ED);
  static const cF2F2F2 = Color(0xFFF2F2F2);
  static const c6CCA51 = Color(0xFF6CCA51);
  static const c24E343 = Color(0xFF24E343);
  static const cbfffca = Color(0xFFbfffca);
  static const cFF7477 = Color(0xFFFF7477);
  static const c00B3DF = Color(0xFF00B3DF);
  static const c131113 = Color(0xFF131113);
  static const c8E8E93 = Color(0xFF8E8E93);
  
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
  static const font18 = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontFamily: 'Gilroy',
  );
  
  static const font18grey = TextStyle(
    fontSize: 18,
    color: AppColors.c8E8E93,
    fontFamily: 'Gilroy',
  );
  static const font20 = TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontFamily: 'Gilroy',
  );
  static const font24 = TextStyle(
    fontSize: 24,
    color: Colors.black,
    fontFamily: 'Gilroy',
  );
  static const font22 = TextStyle(
    fontSize: 22,
    color: Colors.black,
    fontFamily: 'Gilroy',
  ); 
  

  static const font28 = TextStyle(
    fontSize: 28,
    color: Colors.black,
    fontFamily: 'Gilroy',
  );
  static const font30 = TextStyle(
    fontSize: 30,
    color: Colors.black,
    fontFamily: 'Gilroy',
  );
  
  static const font32 = TextStyle(
    fontSize: 32,
    color: Colors.black,
    fontFamily: 'Gilroy',
  );

  static const font36 = TextStyle(
    fontSize: 36,
    color: Colors.white,
    fontFamily: 'Gilroy',
  );

  static const inputBorderDecoration = InputDecoration(
    contentPadding: EdgeInsets.only(bottom: 12, top: 8,),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.c00B3DF)),
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