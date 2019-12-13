import 'dart:collection';

import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../theme.dart';

class ExchangeSuccess extends StatefulWidget {
  ExchangeSuccess({Key key}) : super(key: key);

  @override
  ExchangeSuccessSuccessState createState() => ExchangeSuccessSuccessState();
}

class ExchangeSuccessSuccessState extends State<ExchangeSuccess> {
  var convertfrom = "";
  var convertto = "";
  var from = "";
  
  var CheckStatus = "success";
  //var CheckStatus = "failed" ;
  
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
      convertfrom = args['convertfrom'];
      convertto = args['convertto'];
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
                                  :  Text("Some exchange problem!",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 116, 119, 1),
                                              fontFamily: 'Gilroy',
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none))
                                      ,
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: CheckStatus == "success"
                                  ? Text("The exchange will be credited in a few seconds.",
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontFamily: 'Gilroy',
                                          fontSize: 16.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w500))
                                  :  Text(
                                          "You are not confirmed payment.We recommend to check your entered data and try paymeny again.",
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontFamily: 'Gilroy',
                                              fontSize: 16.0,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w500))
                                      ,
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
                                          child: Text("From",
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
                                                    Text("GBP",
                                                            style: AppStyles
                                                                .font20
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
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
                                            Text("-$convertfrom",style: AppStyles.font22
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),)
                                          ],
                                        ),

                                        ///by card
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 9.0, top: 25.0),
                                          child: Text("To",
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
                                                  color: Color.fromRGBO(
                                                      247, 147, 26, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    image: DecorationImage(
                                                        image: ExactAssetImage(
                                                            "assets/images/BTC.png"))),
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
                                                        Text("BTC",
                                                            style: AppStyles
                                                                .font20
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                      ],
                                                    ),
                                                    Text(
                                                      "Bitcoin",
                                                      style: TextStyle(
                                                          color: Colors.grey[500],
                                                          fontSize: 16.0,
                                                          fontFamily: 'Gilroy'),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Text("+$convertto",
                                      style: AppStyles.font24.copyWith(
                                          color: AppColors.c24E343,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none))
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
                                                
                                                    
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text("Exchange fee",
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
                                                      "£4.99",
                                                      style: AppStyles.font22
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              
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
                                                var count = 0;
                                               from == "buybtc" ? Navigator.popUntil(context,
                                                    (route) {
                                                  return count++ == 4;
                                                }) : Navigator.popUntil(context,
                                                    (route) {
                                                  return count++ == 3;
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
