import 'dart:collection';

import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../theme.dart';

class TopupaccountSuccess extends StatefulWidget {
  TopupaccountSuccess({Key key}) : super(key: key);

  @override
  _TopupaccountSuccessState createState() => _TopupaccountSuccessState();
}

class _TopupaccountSuccessState extends State<TopupaccountSuccess> {
  var currencyText = "";
  var amount = "";
  var amountinBank = "";
  var CheckStatus = "success";
  var from = "";
  //var CheckStatus = "failed" ;
  //var CheckStatus = "sdsd";
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
    //currencyText
    final LinkedHashMap<String, String> args =
        ModalRoute.of(context).settings.arguments;
    setState(() {
      currencyText = args['currencyText'];
      amount = args['amount'];
      amountinBank = args['amountinBank'];
      from = args['from'];
    });

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
                                  child: CheckStatus == "success"
                                      ? Image.asset("assets/images/success.png")
                                      : Image.asset("assets/images/failed.png")),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 22),
                              child: CheckStatus == "success"
                                  ? Text("Success!",
                                      style: AppStyles.font24.copyWith(
                                          color: AppColors.c24E343,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none))
                                  : CheckStatus == "failed"
                                      ? Text("Money request failed!",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 116, 119, 1),
                                              fontFamily: 'Gilroy',
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none))
                                      : Text("Not enough money!",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 116, 119, 1),
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24.0,
                                              decoration: TextDecoration.none)),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: CheckStatus == "success"
                                  ? Text("You've topped up your account.",
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontFamily: 'Gilroy',
                                          fontSize: 16.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w500))
                                  : CheckStatus == "failed"
                                      ? Text(
                                          "You are not confirmed payment.We recommend to check your entered data and try paymeny again.",
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontFamily: 'Gilroy',
                                              fontSize: 16.0,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w500))
                                      : Text(
                                          "Your card has not enough money to Top Up Fbp account.",
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontFamily: 'Gilroy',
                                              fontSize: 16.0,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 9.0),
                                          child: Text("Account",
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 16.0,
                                                  decoration: TextDecoration.none,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Container(
                                                height: 50.0,
                                                width: 50.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    image: DecorationImage(
                                                        image: ExactAssetImage(
                                                            "assets/images/eng.png"))),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 0.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Text("$currencyText",
                                                            style: AppStyles
                                                                .font20
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              "$amountinBank",
                                                              style: AppStyles
                                                                  .font20
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600)),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      "British Pound",
                                                      style: TextStyle(
                                                          color: Colors.grey[500],
                                                          fontSize: 16.0,
                                                          fontFamily: 'Gilroy'),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        ///by card
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 9.0, top: 25.0),
                                          child: Text("By card",
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 16.0,
                                                  decoration: TextDecoration.none,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Container(
                                                height: 50.0,
                                                width: 50.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    image: DecorationImage(
                                                        image: ExactAssetImage(
                                                            "assets/images/master.png"))),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 0.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Text("Mastercard * 4322",
                                                            style: AppStyles
                                                                .font20
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                      ],
                                                    ),
                                                    Text(
                                                      "Bank of America",
                                                      style: TextStyle(
                                                          color: Colors.grey[500],
                                                          fontSize: 16.0,
                                                          fontFamily: 'Gilroy'),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        // Amount and top up fee

                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: <Widget>[
                                                  Text("Amount",
                                                      style: TextStyle(
                                                          color: Colors.grey[500],
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 16.0,
                                                          decoration:
                                                              TextDecoration.none,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6.0),
                                                    child: Text(
                                                      "$amount",
                                                      style: AppStyles.font22
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: <Widget>[
                                                  Text("Top up fee",
                                                      style: TextStyle(
                                                          color: Colors.grey[500],
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 16.0,
                                                          decoration:
                                                              TextDecoration.none,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6.0),
                                                    child: Text(
                                                      "£0.00",
                                                      style: AppStyles.font22
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
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
                                                if (from == "acountdetails"){
                                                  var count = 0;
                                                Navigator.popUntil(context,
                                                    (route) {
                                                  return count++ == 3;
                                                });
                                                }
                                                else
                                                {
                                                  var count = 0;
                                                Navigator.popUntil(context,
                                                    (route) {
                                                  return count++ == 2;
                                                });
                                                }
                                                
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
