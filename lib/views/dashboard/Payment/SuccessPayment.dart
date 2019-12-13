import 'dart:collection';

import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:share/share.dart';
import '../../theme.dart';

class PaymentSuccess extends StatefulWidget {
  PaymentSuccess({Key key}) : super(key: key);

  @override
  PaymentSuccessSuccessState createState() => PaymentSuccessSuccessState();
}

class PaymentSuccessSuccessState extends State<PaymentSuccess> {
  var amount = "";
  var paymenttype = "";
  var heading = ["Today (24 August)","Today","Your money's being processed.","Today","Today"];
  List<String> testing = ["Today (24 August)","Today","Your money's being processed.","Today","Today"];
  List<String> subheading = ["You set up transfer to EUR account.","You used your GBP account.","we'll pay it out in the next 4 minuts.","We pay out your EUR.","Your money is due to arrive today."];
  var showDetails = false;
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
  
  @override
  Widget build(BuildContext context) {
   
    //currencyText
    final LinkedHashMap<String, String> args =
        ModalRoute.of(context).settings.arguments;
    setState(() {
      amount = args['amount'];
      paymenttype = args['paymenttype'];
      
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
                                  ? Text("Funds will be received within 1 day.",
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
                             Padding(
                             padding: EdgeInsets.only(top: 22),
                             child: GestureDetector(
                               onTap: (){
                                 setState(() {
                                   showDetails == false ? showDetails = true : showDetails = false;
                                 });
                               },
                               child: Text(showDetails ? "Hide transfer details" : "Show transfer details",
                               style:AppStyles.font15.copyWith(
                                 decoration: TextDecoration.none,color:Color.fromRGBO(0, 179, 223, 1))),
                             ),
                             ),

                             Padding(
                              padding: EdgeInsets.only(top: 15,bottom: 15),
                              child: Visibility(
                                visible: showDetails,
                                child: Container(
                                  height: 250,
                                  width: double.infinity,
                                  child: new ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: subheading.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new Stack(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: new Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(5),
                            child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(testing[index],style: AppStyles.font16.copyWith(fontWeight: FontWeight.w400,color: Colors.grey[500],decoration: TextDecoration.none),),
                              Text(subheading[index],style: AppStyles.font16.copyWith(fontWeight: FontWeight.w400,color: Colors.grey[500],decoration: TextDecoration.none),),
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
                            color: Colors.blue,
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
                                  color: Color.fromRGBO(42, 183, 133, 1)),
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
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                          padding: const EdgeInsets.only(top : 15.0),
                                          child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    Colors.grey[200],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2.0),
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .account_balance,
                                                                  color: Colors
                                                                      .grey[700],
                                                                ),
                                                              ),
                                                            )),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Container(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                    "Helena Brauer : GBP",
                                                                    style: AppStyles
                                                                        .font20
                                                                        .copyWith(
                                                                            fontWeight:
                                                                                FontWeight.w500)),
                                                                Text(
                                                                    "Account number: 23242134",
                                                                    style: AppStyles
                                                                        .font16
                                                                        .copyWith(
                                                                            color: Colors.grey[600])),
                                                                Text(
                                                                    "Sort code: 23-54-65",
                                                                    style: AppStyles
                                                                        .font16
                                                                        .copyWith(
                                                                            color:
                                                                                Colors.grey[600])),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        
                                                      ],
                                                    ),
                                        ),

                                        ///How to send
                                        Padding(
                                          padding: const EdgeInsets.only(
                                               top: 25.0),
                                          child: Text("How to send",
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 16.0,
                                                  decoration: TextDecoration.none,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top : 15),
                                          child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                            height: 40,
                                                            width: 40,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    Colors.white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2.0),
                                                              child: Image.asset(
                                                                  "assets/images/eng.png"),
                                                            )),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8.0),
                                                            child: Container(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  Text("GBP",
                                                                      style: AppStyles
                                                                          .font20
                                                                          .copyWith(
                                                                              fontWeight:
                                                                                  FontWeight.w500)),
                                                                  Text(
                                                                      "£981.26",
                                                                      style: AppStyles
                                                                          .font18
                                                                          .copyWith(
                                                                              color: Colors.grey[600])),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                             Column(                                                
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("Amount",
                                                      style: TextStyle(
                                                          color: Colors.grey[500],
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 15.0,
                                                          decoration:
                                                              TextDecoration.none,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6.0),
                                                    child: Text(
                                                      "-$amount",
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("Transfer fee ($paymenttype)",
                                                      style: TextStyle(
                                                          color: Colors.grey[500],
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 15.0,
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
                                  height: 165.0,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                    margin: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.c00B3DF),
                                      borderRadius: BorderRadius.circular(25)
                                    ),
                                    child: RaisedGradientButton(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.notifications_none,color: AppColors.c00B3DF,size: 30,),
                                          Text(
                                            "Notify Recipient",
                                            style: AppStyles.buttonTextStyle.copyWith(color: AppColors.c00B3DF,fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      
                                      onPressed: () {
                                        setState(() {
                                          Share.share(
                                      'check out my website https://example.com',
                                      subject: 'Look what I made!');
                                        });
                                      },
                                    ),
                                  ),
                                
                                      Container(
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
                                              
                                              Navigator.of(context).popAndPushNamed("dashboard");
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
              );
            })),
      ),
    );
  }

  

}
