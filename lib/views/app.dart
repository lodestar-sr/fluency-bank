import 'package:flutter/material.dart';
import 'package:wealthpal/views/signup/signup_1.dart';
import 'package:wealthpal/views/signup/signup_2.dart';
import 'package:wealthpal/views/signup/signup_3.dart';
import 'package:wealthpal/views/signup/signup_4.dart';
import 'package:wealthpal/views/signup/signup_end.dart';
import 'package:wealthpal/views/theme.dart';
import 'package:wealthpal/views/verify/topup.dart';
import 'package:wealthpal/views/verify/vcard_done.dart';
import 'package:wealthpal/views/verify/verify_1.dart';
import 'package:wealthpal/views/verify/verify_3.dart';
import 'package:wealthpal/views/verify/verify_4.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      home: Verify1(),
      routes: {
        'signup_1': (_) => Signup1(),
        'signup_2': (_) => Signup2(),
        'signup_3': (_) => Signup3(),
        'signup_4': (_) => Signup4(),
        'signup_end': (_) => SignupEnd(),

        'topup': (_) => Topup(),
        'verify_1': (_) => Verify1(),
        'verify_3': (_) => Verify3(),
        'verify_4': (_) => Verify4(),
        'vcard_done': (_) => VCardDone(),
      },
    );
  }

}