import 'dart:async';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/components/verification_code_input.dart';
import 'package:fluencybank/views/theme.dart';

class Passcode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PasscodeState();
  }
}

class _PasscodeState extends State<Passcode> {

  String code = '';
  String repeatCode = '';
  bool canContinue = false;
  bool obscurePasscode = true;
  bool showRepeat = false;

  completeInputCode(String code) {}

  changeInputCode(String code) {
    if (code.length == 4) {
      setState(() {
        this.code = code;
        if (this.showRepeat && this.repeatCode == this.code && this.repeatCode.length == 4) {
          canContinue = true;
        } else if (this.repeatCode == '') {
          canContinue = true;
        } else {
          canContinue = false;
        }
      });
    } else {
      setState(() {
        canContinue = false;
      });
    }
  }

  // check Repeat Code
  completeRepeatCode(String code) {}

  changeRepeatCode(String code) {
    if (code.length == 4) {
      setState(() {
        this.repeatCode = code;
        if (this.repeatCode == this.code && this.code.length == 4) {
          canContinue = true;
        } else {
          canContinue = false;
        }
      });
    } else {
      setState(() {
        canContinue = false;
      });
    }
  }

  onTogglePasscode() {
    setState(() {
      obscurePasscode = !obscurePasscode;
    });
  }  
  addBoolToSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("loginComplte", true);
}

  submitPassCode() {
    if (!this.showRepeat && this.code != '') {
      // First Step
      setState(() {
        canContinue = false;
        obscurePasscode = true;
        showRepeat = true;
      });
    } else if (this.repeatCode == this.code && this.code.length == 4) {
      // Final Step
      addBoolToSF();
      Navigator.of(context).pushNamed('dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 64, left: 16),
                        child: Text("Create a passcode for your Fluency account", style: AppStyles.font24.copyWith(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 140, left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            VerificationCodeInput(
                              keyboardType: TextInputType.number,
                              itemWidth: 40,
                              itemHeight: 56,
                              itemGap: 8,
                              separateMiddle: false,
                              obscure: obscurePasscode,
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                              ),
                              onCompleted: completeInputCode,
                              onChanged: changeInputCode,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 24),
                              child: GestureDetector(
                                child: Image.asset(
                                  obscurePasscode ? 'assets/images/eye-gray.png' : 'assets/images/eye-black.png',
                                  width: 26,
                                ),
                                onTap: onTogglePasscode,
                              ),
                            ),
                          ],
                        ),
                      ),
                      showRepeat ? Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 32, right: 32),
                          child: Text(
                            "Repeat the passcode",
                            style: AppStyles.font12.copyWith(color: Colors.black),
                          ),
                        ),
                      ) : Container(),
                      showRepeat ? Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            VerificationCodeInput(
                              keyboardType: TextInputType.number,
                              itemWidth: 40,
                              itemHeight: 56,
                              itemGap: 8,
                              separateMiddle: false,
                              obscure: obscurePasscode,
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                              ),
                              onCompleted: completeRepeatCode,
                              onChanged: changeRepeatCode,
                            ),
                            Container(width: 48),
                          ],
                        ),
                      ) : Container(),
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
                                        colors: [AppColors.c00B3DF, AppColors.c00B3DF],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      )
                                    : LinearGradient(
                                        colors: [AppColors.cBDBDBD, AppColors.cBDBDBD],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                onPressed: canContinue ? submitPassCode : null,
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
