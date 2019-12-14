import 'dart:collection';

import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:share/share.dart';
import '../../theme.dart';

class Payment_Receipt_person extends StatefulWidget {
  Payment_Receipt_person({Key key}) : super(key: key);

  @override
  Payment_Receipt_personSuccessState createState() =>
      Payment_Receipt_personSuccessState();
}

class Payment_Receipt_personSuccessState extends State<Payment_Receipt_person> {
  var amount1 = "";
  var amount2 = "";
  var paymenttype = "";
  var time = "";
  List<String> testing = [
    "7 June",
    "7 June",
    "7 June",
    "7 June",
    "8 June"
  ];
  List<String> subheading = [
    "You set up transfer to EUR account.",
    "You used your GBP account.",
    "Your money's being processed",
    "We pay out your EUR.",
    "Your money arrived."
  ];
  var showDetails = false;
  @override
  Widget build(BuildContext context) {
    //currencyText
    final LinkedHashMap<String, String> args =
        ModalRoute.of(context).settings.arguments;
    setState(() {
      amount1 = args['amount1'];
      amount2 = args['amount2'];
      paymenttype = args['paymenttype'];
      time = args['time'];
    });

    return SafeArea(
      child: ModalProgressHUD(
          inAsyncCall: false,
          color: AppColors.c00B3DF,
          progressIndicator: CircularProgressIndicator(),
          child: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  color: Colors.black, //change your color here
                ),
              ),
              body: SingleChildScrollView(
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
                              padding: EdgeInsets.only(top: 10.0),
                              child: Container(
                                  height: 60.0,
                                  width: 60.0,
                                  child:
                                      Image.asset("assets/images/invoice.png")),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 22),
                              child: Text("Payment receipt.",
                                  style: AppStyles.font24.copyWith(
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none)),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: RichText(
                                text: TextSpan(
                                  text: '7 June 2019,$time - ',
                                  style: AppStyles.font18.copyWith(color: Colors.grey[600]),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Done',
                                        style: AppStyles.font20.copyWith(color: AppColors.c24E343,fontWeight: FontWeight.w500,fontSize: 19)),
                                    
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 18),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showDetails == false
                                        ? showDetails = true
                                        : showDetails = false;
                                  });
                                },
                                child: Text(
                                    showDetails
                                        ? "Hide transfer details"
                                        : "Show transfer details",
                                    style: AppStyles.font18.copyWith(
                                        decoration: TextDecoration.none,fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(0, 179, 223, 1))),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              child: Visibility(
                                visible: showDetails,
                                child: Container(
                                  height: 250,
                                  width: double.infinity,
                                  child: new ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: subheading.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return new Stack(
                                        children: <Widget>[
                                          new Padding(
                                            padding: const EdgeInsets.only(
                                                left: 50.0),
                                            child: new Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.all(5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    testing[index],
                                                    style: AppStyles.font18
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: index == 4? Color.fromRGBO(108, 202, 81, 1):Colors
                                                                .grey[600],
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                  ),
                                                  Text(
                                                    subheading[index],
                                                    style: AppStyles.font16
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: index == 4? Color.fromRGBO(108, 202, 81, 1):Colors
                                                                .grey[600],
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          new Positioned(
                                            top: 0.0,
                                            bottom: 0.0,
                                            left: 25.0,
                                            child: new Container(
                                              height: double.infinity,
                                              width: 1.0,
                                              color: Color.fromRGBO(42, 183, 133, 1),
                                            ),
                                          ),
                                          new Positioned(
                                            top: 10.0,
                                            left: 15.0,
                                            child: new Container(
                                              height: 20.0,
                                              width: 20.0,
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: new Container(
                                                margin: new EdgeInsets.all(5.0),
                                                height: 10.0,
                                                width: 10.0,
                                                decoration: new BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromRGBO(
                                                        108, 202, 81, 1)),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            //card
                            Padding(
                              padding: EdgeInsets.only(top: 5),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Recipient",
                                            style: TextStyle(
                                                color: Colors.grey[500],
                                                fontFamily: 'Gilroy',
                                                fontSize: 16.0,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.w500)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[200],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Icon(
                                                        Icons.account_balance,
                                                        color: Colors.grey[700],
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                          "Helena Brauer : GBP",
                                                          style: AppStyles
                                                              .font20
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                      Text(
                                                          "Account number: 23242134",
                                                          style: AppStyles
                                                              .font16
                                                              .copyWith(
                                                                  color: Colors
                                                                          .grey[
                                                                      600])),
                                                      Text(
                                                          "Sort code: 23-54-65",
                                                          style: AppStyles
                                                              .font16
                                                              .copyWith(
                                                                  color: Colors
                                                                          .grey[
                                                                      600])),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        ///How to send
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 25.0),
                                          child: Text("How to send",
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 16.0,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Image.asset(
                                                        "assets/images/eng.png"),
                                                  )),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text("GBP",
                                                            style: AppStyles
                                                                .font20
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                        Text("£981.26",
                                                            style: AppStyles
                                                                .font18
                                                                .copyWith(
                                                                    color: Colors
                                                                            .grey[
                                                                        600])),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Amount and top up fee

                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("Amount",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[500],
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 15.0,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6.0),
                                                    child: Text(
                                                      "$amount1",
                                                      style: AppStyles.font22
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ),
                                                   Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6.0),
                                                    child: Text(
                                                      "$amount2",
                                                      style: AppStyles.font20
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,color: Colors.grey[500]),
                                                    )
                                                   ),

                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                      "Transfer fee ($paymenttype)",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[500],
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 15.0,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6.0),
                                                    child: Text(
                                                      "€0.00",
                                                      style: AppStyles.font22
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(top : 10.0),
                                                     child: Text(
                                                        "Exchange fee",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey[500],
                                                            fontFamily: 'Gilroy',
                                                            fontSize: 15.0,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            fontWeight:
                                                                FontWeight.w500)),
                                                   ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6.0),
                                                    child: Text(
                                                      "€0.00",
                                                      style: AppStyles.font22
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
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
                                  height: 165.0,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(16),
                                        child: RaisedGradientButton(
                                          child: Text(
                                            "Share receipt",
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
                                              ///
                                            });
                                          },
                                        ),
                                      ),
                                    ],
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
              ),
            );
          })),
    );
  }
}
