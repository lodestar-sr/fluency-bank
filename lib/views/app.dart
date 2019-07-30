import 'package:flutter/material.dart';
import 'package:wealthpal/views/signup/signup_1.dart';
import 'package:wealthpal/views/theme.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      home: Signup1(),
    );
  }

}