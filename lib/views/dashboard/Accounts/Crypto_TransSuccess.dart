//Crypto_TransSuccess

import 'dart:collection';

import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:share/share.dart';
import '../../theme.dart';

class Crypto_TransSuccess extends StatefulWidget {
  Crypto_TransSuccess({Key key}) : super(key: key);

  @override
  Crypto_TransSuccessSuccessState createState() => Crypto_TransSuccessSuccessState();
}

class Crypto_TransSuccessSuccessState extends State<Crypto_TransSuccess> {
  var bitcoinamount = "";
  var poundsamount = "";
  var barcode = "";
  var heading = ["Today (24 August)","Today","Your money's being processed.","Today","Today"];
  List<String> testing = ["Today (24 August)","Today","Your money's being processed.","Today","Today"];
  List<String> subheading = ["You set up transfer to EUR account.","You used your GBP account.","we'll pay it out in the next 4 minuts.","We pay out your EUR.","Your money is due to arrive today."];
  var showDetails = false;
  var CheckStatus = "success";
  //var CheckStatus = "failed" ;
  bool saveWalletname = false;
  TextEditingController createWalletNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //currencyText
    final LinkedHashMap<String, String> args =
        ModalRoute.of(context).settings.arguments;
    setState(() {
      bitcoinamount = args['BitcoinAmount'];
      poundsamount = args['PoundsAmount'];
      barcode = args['barcode'];
      
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
                                  ? Text("Funds will be received within 5 minutes.",
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
                              padding: EdgeInsets.only(top: 25),
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
                                                                  LineAwesomeIcons.bitcoin,size: 30,
                                                                  color: Colors
                                                                      .grey[700],
                                                                ),
                                                              ),
                                                            )),
                                                        Expanded(
                                                           child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8.0),
                                                            child: Container(
                                                              child: Text(barcode,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: AppStyles.font16.copyWith(color: Colors.grey[700],fontWeight: FontWeight.w500,))
                                                            ),
                                                          ),
                                                        ),
                                                        
                                                      ],
                                                    ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(top: 20 , bottom: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(17),
                                              child: Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: <Widget>[
                                                 Container(
                                                   child: Row(
                                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                     children: <Widget>[
                                                       Expanded(child: Text("Save this wallet address in you list?",style: AppStyles.font20.copyWith(color: Colors.grey[700]),)),
                                                     Padding(
                                                       padding: const EdgeInsets.only(left : 20.0),
                                                       child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        child:
                                                            CupertinoSwitch(
                                                          value: saveWalletname,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              saveWalletname =
                                                                  value;
                                                            });
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                        ),
                                                    ),
                                                     )

                                                     ],
                                                   ),
                                                 ),

                                                 Padding(
                                                   padding: EdgeInsets.only(top: 15),
                                                   child: Visibility(
                                                     visible: saveWalletname,                                                
                                                     child: TextField(
                                                       style: AppStyles.font20,
                                                       controller: createWalletNameController,
                                                       decoration: InputDecoration(
                                                         hintText: "Create wallet name",
                                                         hintStyle: AppStyles.font20.copyWith(color: Colors.grey[500])
                                                       ),
                                                     ),
                                                   ),
                                                 )
                                               ],
                                              ),
                                            ),
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
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(10.0),
                                                    color: Color.fromRGBO(
                                                        247, 147, 26, 1),
                                                    image: DecorationImage(
                                                        image: ExactAssetImage(
                                                            "assets/images/BTC.png"))),
                                              ),
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
                                                                  Text("BTC  ₿0.1125",
                                                                      style: AppStyles
                                                                          .font20
                                                                          .copyWith(
                                                                              fontWeight:
                                                                                  FontWeight.w600)),
                                                                  Text(
                                                                      "Bitcoin",
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
                                             Expanded(
                                                                                            child: Column(                                                
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
                                                        "$bitcoinamount",
                                                        style: AppStyles.font22
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                    ),
                                                    
                                                  ],
                                                ),
                                             ),
                                             
                                             
                                             
                                              Column(                                         
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("Transfer fee ",
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
                                                      "₿0.00",
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
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text(poundsamount,style:AppStyles.font20.copyWith(color:Colors.grey[500])),
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
