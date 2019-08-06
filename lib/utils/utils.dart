import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:wealthpal/utils/constants.dart';

String printDuration(int sec) {
  Duration duration = Duration(seconds: sec);
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}

Future getVerificationCode(String phone) async {
  var response = await http.get(Constants.smsVerificationAPI + phone);
  if (response.statusCode == 200) {
    String body = response.body;
    return body;
  } else {
    throw Exception('Please input valid phone number: +[code][phonenumber]');
  }
}

Future showSimpleAlert({BuildContext context, String title}) {

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(title),
        actions: [
          FlatButton(
            child: Text("Ok"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}