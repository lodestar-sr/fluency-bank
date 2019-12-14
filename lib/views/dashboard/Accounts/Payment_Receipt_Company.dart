import 'dart:collection';

import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:share/share.dart';
import '../../theme.dart';

class Payment_Receipt_Company extends StatefulWidget {
  Payment_Receipt_Company({Key key}) : super(key: key);

  @override
  Payment_Receipt_CompanySuccessState createState() =>
      Payment_Receipt_CompanySuccessState();
}

class Payment_Receipt_CompanySuccessState extends State<Payment_Receipt_Company> {
  var amount1 = "";
  var amount2 = "";
  var paymenttype = "";
  var time = "";
  var name = "";
  var image = "";
   
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
      name = args['name'];
      image = args['image'];
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
                                  text: '7 June 2019, $time - ',
                                  style: AppStyles.font18.copyWith(color: Colors.grey[600]),
                                  children: <TextSpan>[
                                   // TextSpan(
                                       // text: 'Done',
                                       // style: AppStyles.font20.copyWith(color: AppColors.c24E343,fontWeight: FontWeight.w500,fontSize: 19)),
                                    
                                  ],
                                ),
                              ),
                            ),
                        
                            //card
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Card(
                                color: Color.fromRGBO(249, 249, 249, 1),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15,
                                      left: 15.0,
                                      right: 15.0,
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
                                                height: 40,
                                                width: 40,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[200],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Image.asset("assets/images/$image.png"),
                                                  )),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0),
                                                child: Text(
                                                    name,
                                                    style: AppStyles
                                                        .font20
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                              ),
                                            ],
                                          ),
                                        ),

                                        
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 25.0),
                                          child: Text("How paid (how many left)",
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
                                                      color: Color.fromRGBO(247, 147, 26, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Image.asset(
                                                        "assets/images/BTC.png"),
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
                                                        Text("BTC",
                                                            style: AppStyles
                                                                .font20
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                        Text("₿0.016",
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
                                                MainAxisAlignment.start,
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
                                              Share.share(
                                                'Recipient :- $name \n Currency:- BTC \n Amount :- $amount1',
                                      subject: 'Payment Receipt');
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
