import 'dart:collection';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import "package:flutter/material.dart";

import '../../theme.dart';

class Accountcreated extends StatefulWidget {
  Accountcreated({Key key}) : super(key: key);

  @override
  _accountcreatedState createState() => _accountcreatedState();
}

class _accountcreatedState extends State<Accountcreated> {
  var currency;
  var currencyname;
  var code = 0;
  var codeint;
  var money;
  @override
  Widget build(BuildContext context) {
    final LinkedHashMap<String, String> args =
        ModalRoute.of(context).settings.arguments;
    setState(() {
      currency = args['cryncurrency'];
      currencyname = args['cryncurrencyname'];
      codeint = args['count'];
      code = int.parse(codeint);
      money = args['money'];
    });
    return SafeArea(
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
                                child:
                                    Image.asset("assets/images/success.png")),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 22),
                            child: Text("Success!",
                                style: AppStyles.font24.copyWith(
                                    color: AppColors.c24E343,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                                "You've activated you $currency account.",
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontFamily: 'Gilroy',
                                    fontSize: 20.0,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w500)),
                          ),

                          //card
                          Padding(
                            padding: EdgeInsets.only(top: 22),
                            child: Card(
                              color: Color.fromRGBO(249, 249, 249, 1),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15,
                                    left: 10.0,
                                    right: 10.0,
                                    bottom: 15.0),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Colors.white),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Container(
                                                height: 55.0,
                                                width: 55.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: code == 0
                                                        ? Color.fromRGBO(
                                                            247, 147, 26, 1)
                                                        : code == 3
                                                            ? Color.fromRGBO(
                                                                141, 195, 81, 1)
                                                            : Colors.white,
                                                    image: DecorationImage(
                                                        image: ExactAssetImage(
                                                            "assets/images/$currency.png"))),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 15.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    Text("${currency}",
                                                        style: AppStyles.font22
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                    Text(
                                                      "${currencyname}",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[500],
                                                          fontSize: 18.0),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 22.0),
                                        child: Center(
                                          child: Text(
                                            "Account activation fee",
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontFamily: 'Gilroy',
                                                fontSize: 18.0,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Center(
                                          child: Text(
                                            "$money",
                                            style: AppStyles.font32.copyWith(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      // buybutton
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.c00B3DF),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        margin: EdgeInsets.all(16),
                                        child: RaisedGradientButton(
                                          child: Text(
                                            "Buy BTC",
                                            style: TextStyle(
                                              fontSize: 17.0,
                                              color: AppColors.c00B3DF,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          // gradient:  LinearGradient(
                                          //         colors: [AppColors.c00B3DF, AppColors.c00B3DF],
                                          //         begin: Alignment.topCenter,
                                          //         end: Alignment.bottomCenter,
                                          //       )

                                          onPressed: null,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Done button

                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: EdgeInsets.all(16),
                                child: RaisedGradientButton(
                                  child: Text(
                                    "Continue",
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
                                      Navigator.popUntil(context, (route) {
                                        return count++ == 2;
                                      });
                                    });
                                  },
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
    );
  }
}
