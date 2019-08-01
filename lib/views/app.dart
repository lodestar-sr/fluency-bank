import 'package:flutter/material.dart';
import 'package:wealthpal/views/signup/signup_1.dart';
import 'package:wealthpal/views/signup/signup_2.dart';
import 'package:wealthpal/views/signup/signup_3.dart';
import 'package:wealthpal/views/theme.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      home: Signup1(),
      routes: {
        'signup_1': (_) => Signup1(),
        'signup_2': (_) => Signup2(),
        'signup_3': (_) => Signup3(),
      },
    );
  }

}