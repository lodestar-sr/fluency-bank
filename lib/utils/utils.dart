import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  var response = await http.get(
      Constants.smsVerificationAPI + phone,
      headers: {
        'X-Auth': Constants.apiKey,
      }
  );
  if (response.statusCode == 200) {
    String body = response.body;
    return body;
  } else {
    throw Exception('Please input valid phone number: \n+[code][phonenumber]');
  }
}

Future showSimpleAlert({BuildContext context, String title = '', String message, String button = 'Ok'}) async {

  const platform = const MethodChannel('flutter.native/helper');

  try {
    final String result = await platform.invokeMethod('showAlert', <String, String>{
      'title': title,
      'message': message,
      'button': button,
    });
  } on Exception catch(e) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            FlatButton(
              child: Text(button),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}