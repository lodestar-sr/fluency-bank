import 'dart:collection';

import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';



class PinCodeChangeSucess extends StatefulWidget {
  PinCodeChangeSucess({Key key}) : super(key: key);

  @override
  PinCodeChangeSucessSuccessState createState() => PinCodeChangeSucessSuccessState();
}

class PinCodeChangeSucessSuccessState extends State<PinCodeChangeSucess> {
  
  
  var CheckStatus = "success";
  
  
  var visibilty = true;

  @override
  void initState() { 
    super.initState();
    if (CheckStatus == "success") {
      setState(() {
        visibilty = true;
      });
      
    } else {
      setState(() {
        visibilty = false;
      });
    }
    
  }
  //TODO: Money request failed // Not enought money widget remaining
  @override
  Widget build(BuildContext context) {
    

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
              child: ModalProgressHUD(
            inAsyncCall: false,
            color: AppColors.c00B3DF,
            progressIndicator: CircularProgressIndicator(),
            child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 30.0),
                              child: Container(
                                  height: 60.0,
                                  width: 60.0,
                                  child: Image.asset("assets/images/success.png")
                                      ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 22),
                              child: Text("Success!",
                                      style: AppStyles.font24.copyWith(
                                          color: AppColors.c24E343,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none))
                                  
                                      ,
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text("You have changed your Fluency PIN code. Now you can use the new PIN code to sign in and confirm payments and actions in the app.",
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontFamily: 'Gilroy',
                                          fontSize: 16.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w500))
                                  
                                      ,
                            ),

                           

                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 150.0,
                                  child: Visibility(
                                        visible: visibilty,
                                        child: Container(
                                          margin: EdgeInsets.all(16),
                                          child: RaisedGradientButton(
                                            child: Text(
                                              "Done",
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
                                            onPressed: () {
                                              setState(() {
                                                var count = 0;
                                                Navigator.popUntil(context,
                                                    (route) {
                                                  return count++ == 2;
                                                });
                                              });
                                            },
                                          ),
                                        ),
                                        replacement: Column(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.all(16),
                                              child: RaisedGradientButton(
                                                child: Text(
                                                  "Try again",
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
                                                onPressed: () {
                                                  setState(() {
                                                    var count = 0;
                                                    Navigator.popUntil(context,
                                                        (route) {
                                                      return count++ == 3;
                                                    });
                                                  });
                                                },
                                              ),
                                            )
                                          ,GestureDetector(
                                              onTap: () {
                                                 var count = 0;
                                                Navigator.popUntil(context,
                                                    (route) {
                                                  return count++ == 3;
                                                });
                                              },
                                              child: Text("Close",
                                                  style: AppStyles.buttonTextStyle
                                                      .copyWith(
                                                          decoration:
                                                              TextDecoration.none,
                                                          color:
                                                              AppColors.c00B3DF)),
                                            ),
                                          ],
                                        ),
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
