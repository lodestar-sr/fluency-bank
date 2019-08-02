import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:wealthpal/components/raised_gradient_button.dart';
import 'package:wealthpal/components/verification_code_input.dart';
import 'package:wealthpal/utils/utils.dart';
import 'package:wealthpal/views/theme.dart';

class Signup2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Signup2State();
  }
}

class _Signup2State extends State<Signup2> {
  static const int INITIALTIME = 60;

  String phoneNumber = "";
  bool canContinue = false;
  String verificationCode = '';

  Timer _timer;
  int _countSec = INITIALTIME;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_countSec < 1) {
            timer.cancel();
          } else {
            _countSec = _countSec - 1;
          }
        },
      ),
    );
  }

  completeInputCode(String code) {
    setState(() {
      verificationCode = code;
      canContinue = true;
    });
  }

  changeInputCode(String code) {
    if (code.length == 6) {
      setState(() {
        canContinue = true;
      });
    } else {
      setState(() {
        canContinue = false;
      });
    }
  }

  resendSMS() {
    setState(() {
      _countSec = INITIALTIME;
    });
    startTimer();
  }

  submitVerificationCode() {
    Navigator.of(context).pushNamed('signup_3');

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Retrieve the text the user has typed in using our
          // TextEditingController
          content: Text("The verification code you entered is incorrect."),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final LinkedHashMap<String, String> args =
        ModalRoute.of(context).settings.arguments;
    final phoneNumber = args["phone"];

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 28, right: 16, left: 16),
                        alignment: Alignment.centerRight,
                        height: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Image.asset(
                                "assets/images/arrow_back.png",
                                width: 24,
                                height: 24,
                              ),
                            ),
                            Text("Step 2 of 4", style: AppStyles.stepTextStyle),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text("Enter 6-digit sms code",
                            style: AppStyles.dialogTitleStyle),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(
                          "We’ve sent it to ${phoneNumber}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(179, 34, 34, 56),
                            fontFamily: 'Gilroy',
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 40, left: 16, right: 16),
                        child: Column(
                          children: <Widget>[
                            VerificationCodeInput(
                              keyboardType: TextInputType.number,
                              length: 6,
                              itemWidth: 40,
                              itemHeight: 56,
                              itemGap: 8,
                              separateMiddle: true,
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                              ),
                              onCompleted: completeInputCode,
                              onChanged: changeInputCode,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                        child: _countSec != 0
                            ? Text(
                                "You can resend sms code after ${printDuration(_countSec)}",
                                style: TextStyle(
                                    color: AppColors.cBDBDBD, fontSize: 12),
                              )
                            : GestureDetector(
                                child: Text(
                                  "Resend sms",
                                  style: TextStyle(
                                      fontSize: 14, color: AppColors.c7427F2),
                                ),
                                onTap: resendSMS,
                              ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(16),
                              child: RaisedGradientButton(
                                child: Text(
                                  "Continue",
                                  style: AppStyles.buttonTextStyle,
                                ),
                                gradient: canContinue
                                    ? LinearGradient(
                                        colors: [
                                          AppColors.c9100F7,
                                          AppColors.c7427F2
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      )
                                    : LinearGradient(
                                        colors: [
                                          AppColors.cBDBDBD,
                                          AppColors.cBDBDBD
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                shadows: canContinue
                                    ? [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(64, 145, 0, 247),
                                          offset: Offset(0, 4),
                                          blurRadius: 10,
                                        )
                                      ]
                                    : [
                                        BoxShadow(
                                          color: AppColors.cBDBDBD,
                                          offset: Offset(0, 4),
                                          blurRadius: 10,
                                        )
                                      ],
                                onPressed:
                                    canContinue ? submitVerificationCode : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
