import 'dart:async';

import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluencybank/views/theme.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  goSignUp() {
    Navigator.of(context).pushNamed('signup_1');
  }

  goSignIn() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
       onWillPop: () async => false,
          child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: false,
          color: AppColors.c00B3DF,
          progressIndicator: CircularProgressIndicator(),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Stack(children: [
                        Image.asset(
                          "assets/images/bg2.png",
                          width: size.width,
                          fit: BoxFit.fitWidth,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 60, left: 16),
                              child: Image.asset("assets/images/icon.png",
                                  width: 40, height: 40),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 16, right: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Image.asset(
                                            "assets/images/title.png",
                                            width: 142,
                                          ),
                                          Container(
                                            child: Text(
                                              "The world's",
                                              style: AppStyles.font24,
                                            ),
                                            margin: EdgeInsets.only(top: 16),
                                          ),
                                          Container(
                                            child: Text(
                                              "First crypto bank.",
                                              style: AppStyles.font24,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "Borderless. ",
                                                style: AppStyles.font24.copyWith(
                                                    color: AppColors.c00B3DF),
                                              ),
                                              Text(
                                                "Smooth.",
                                                style: AppStyles.font24.copyWith(
                                                    color: AppColors.cFF7477),
                                              )
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 56),
                                            child: RaisedGradientButton(
                                              child: Text(
                                                "Sign Up",
                                                style: AppStyles.buttonTextStyle,
                                              ),
                                              gradient: LinearGradient(
                                                colors: [
                                                  AppColors.c00B3DF,
                                                  AppColors.c00B3DF
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              ),
                                              onPressed: goSignUp,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 32, bottom: 45),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text("Already have an account? ",
                                                    style: AppStyles.font14),
                                                GestureDetector(
                                                  child: Text(
                                                    "Sign In",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: AppColors.c00B3DF),
                                                  ),
                                                  onTap: goSignIn,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
