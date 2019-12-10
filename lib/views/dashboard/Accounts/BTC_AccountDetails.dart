import 'dart:collection';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class BTC_AccountDetails extends StatefulWidget {
  BTC_AccountDetails({Key key}) : super(key: key);

  @override
  _BTC_AccountDetailsState createState() => _BTC_AccountDetailsState();
}

class _BTC_AccountDetailsState extends State<BTC_AccountDetails> {
  var currencyText = "";
  var amount = "";
  @override
  Widget build(BuildContext context) {
    //currencyText
    final LinkedHashMap<String, String> args =
        ModalRoute.of(context).settings.arguments;
    setState(() {
      currencyText = args['currencyText'];
      amount = args['amount'];
    });
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
              child: SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                          child: Container(
                              color: Colors.white,
                              width: double.infinity,
                              child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    Text(
                                                      "$currencyText account",
                                                      style: AppStyles.font18
                                                          .copyWith(
                                                              color: Colors
                                                                  .grey[600]),
                                                    ),
                                                    Text(
                                                      "₿0.00",
                                                      style: AppStyles.font32
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 70,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Color.fromRGBO(
                                                        247, 147, 26, 1),
                                                    image: DecorationImage(
                                                        image: ExactAssetImage(
                                                            "assets/images/BTC.png"))),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: RichText(
                                            text: TextSpan(
                                              style: AppStyles.font18.copyWith(
                                                  color: AppColors.c24E343,
                                                  fontWeight: FontWeight.w500),
                                              text: "+£0.00(+0%)",
                                              children: [
                                                TextSpan(
                                                    text: '  today',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Colors.grey[600])),
                                              ],
                                            ),
                                          ),
                                        ),

                                        //wave
                                        Padding(
                                          padding: EdgeInsets.only(top: 25),
                                          child: GestureDetector(
                                            onTap: (){
                                              Navigator.of(context).pushNamed('BTC_GBP_Graph');
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  color: Colors.grey[100]),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text("BTC/GBP",
                                                              style: AppStyles
                                                                  .font18
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500)),
                                                          Text("£0.00",
                                                              style: AppStyles
                                                                  .font20
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700))
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 180,
                                                      child: Image.asset(
                                                          "assets/images/wave.png"),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(top: 25),
                                          child: GestureDetector(
                                            onTap: ()
                                            {
                                              accountDetailsBottomSheet(context,currencyText);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color:
                                                              Colors.grey[200],
                                                          width: 1))),
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom: 10.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text("Account details",
                                                              style: AppStyles
                                                                  .font20
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700)),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 10),
                                                            child: Text(
                                                                "QR code and wallet number",
                                                                style: AppStyles
                                                                    .font20
                                                                    .copyWith(
                                                                        color: Colors
                                                                                .grey[
                                                                            500])),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Container(
                                                        height: 40,
                                                        width: 40,
                                                        child: Image.asset(
                                                            "assets/images/barcode-qr.png"),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Icon(
                                                          Icons
                                                              .keyboard_arrow_right,
                                                          size: 30,
                                                          color:
                                                              Colors.grey[600]),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                     
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: GestureDetector(
                                            onTap: (){
                                              Navigator.of(context).pushNamed("statement",arguments: <String,String>{
                                                'currencyText' : currencyText
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color:
                                                              Colors.grey[200],
                                                          width: 1))),
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom : 10.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text("Statement",
                                                              style: AppStyles
                                                                  .font20
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700)),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 10),
                                                            child: Text(
                                                                "Send via email as a PDF or Excel file",
                                                                style: AppStyles
                                                                    .font20
                                                                    .copyWith(
                                                                        color: Colors
                                                                                .grey[
                                                                            500])),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Icon(
                                                          Icons
                                                              .keyboard_arrow_right,
                                                          size: 30,
                                                          color:
                                                              Colors.grey[600]),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        //buy 
                                        Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: GestureDetector(
                                            onTap: (){
                                              Navigator.of(context).pushNamed('Buy_BTC');
                                            },
                                            child: Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Color.fromRGBO(36, 227, 67, 0.15)
                                                    ),
                                                    child: Icon(Icons.arrow_downward,size: 35,color: Color.fromRGBO(36, 227, 67, 1,)),
                                                  ),
                                                  Expanded(
                                                                                                      child: Padding(
                                                      padding: EdgeInsets.only(left: 20),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text("Buy",style:AppStyles.font20.copyWith(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700)),
                                                                                Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      top: 5),
                                                              child: Text(
                                                                  "Instantly by simply moving money to this account",
                                                                  style: AppStyles
                                                                      .font16
                                                                      .copyWith(
                                                                          color: Colors
                                                                                  .grey[
                                                                              500])),
                                                            )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        //sell

                                        Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: GestureDetector(
                                            onTap: (){
                                              Navigator.of(context).pushNamed('Sell_BTC');
                                            },
                                            child: Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Color.fromRGBO(255, 116, 119, 0.15,)
                                                    ),
                                                    child: Transform.rotate(
                                                      angle:  -0.8,
                                                      child: Icon(Icons.arrow_upward,size: 35,color: Color.fromRGBO(255, 116, 119, 1,))),
                                                  ),
                                                  Expanded(
                                                                                                      child: Padding(
                                                      padding: EdgeInsets.only(left: 20),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text("Sell",style:AppStyles.font20.copyWith(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700)),
                                                                                Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      top: 5),
                                                              child: Text(
                                                                  "Instantly and for free",
                                                                  style: AppStyles
                                                                      .font16
                                                                      .copyWith(
                                                                          color: Colors
                                                                                  .grey[
                                                                              500])),
                                                            )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        //send money
                                        Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: GestureDetector(
                                            onTap: (){
                                              Navigator.of(context).pushNamed('Crypto_Transfer');
                                            },
                                            child: Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Colors.grey[300]
                                                    ),
                                                    child: Transform.rotate(
                                                      angle:  -18,
                                                      child: Icon(Icons.arrow_upward,size: 35,color: Colors.black)),
                                                  ),
                                                  Expanded(
                                                                                                      child: Padding(
                                                      padding: EdgeInsets.only(left: 20),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text("Send money",style:AppStyles.font20.copyWith(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700)),
                                                                                Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      top: 5),
                                                              child: Text(
                                                                  "Choose recipient and send money",
                                                                  style: AppStyles
                                                                      .font16
                                                                      .copyWith(
                                                                          color: Colors
                                                                                  .grey[
                                                                              500])),
                                                            )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Container(
                                           decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(10),                         
                                            
                                           color: Colors.grey[100]  ,     
                                          ),
                                           child: Column(
                                             children: <Widget>[
                                              Padding(
                                                 padding: EdgeInsets.only(top: 10),
                                               child :Center(
                                                 child: Container(
                                                   width: 60,
                                                   height: 5,
                                                   decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.circular(5),
                                                     color: Colors.grey[400],
                                                     boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(48, 36, 32, 55),
                    offset: Offset(0, 2),
                    blurRadius: 20,
                  ),
                ],
                                                   ),
                                                 ),
                                               ),
                                           ),
                                               Padding(
                                                 padding: EdgeInsets.only(top: 10,left: 10),
                                                 child: Row(
                                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                   children: <Widget>[
                                                     Expanded(
                                                       child: Column(
                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                                         children: <Widget>[
                                                           Text("2019",style: AppStyles.font18.copyWith(color: Colors.grey[600]),),
                                                           Text("25 August",style: AppStyles.font24.copyWith(fontWeight: FontWeight.w600))
                                                         ],
                                                       ),
                                                     ),
                                                     Padding(
                                                       padding: const EdgeInsets.all(10.0),
                                                       child: GestureDetector(
                                                         onTap: (){
                                                           Navigator.of(context).pushNamed('seealllastactions');
                                                         },
                                                         child: Icon(Icons.search,color: Colors.grey[600],size: 40,)),
                                                     )
                                                   ],
                                                 ),
                                               )
                                             ],
                                           ),
                                          ),
                                        )
                                      ])))))));
        }));
  }


  //Bottom sheet
  void accountDetailsBottomSheet(context, String accounttype) {
    var code = "3EHLU8hgBKwucH4N2LYHH46CtZk9RsqScm";
    List<bool> flag = [false,false];
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return SingleChildScrollView(
                          child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 5.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[350],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0,),
                            child: Text("Your $accounttype account details",
                                style: AppStyles.font24
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Scan or share your address",style:AppStyles.font18.copyWith(color:Colors.grey[500])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Container(
                            child: QrImage(
                           data: "$code",
                           version: QrVersions.auto,
                           size: 200.0,
                           ),
                          ),
                        ),
                      ),

                      Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Wallet address",style:AppStyles.font18.copyWith(color:Colors.grey[500])),
                      ),
                      Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 20),
                      child: Text("$code",style:AppStyles.font16.copyWith(fontSize: 17,fontWeight: FontWeight.w600)),
                      ),
                      //button

                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    print("OBject1 tapped");
                                    flag[0] = true;
                                    flag[1] = false;
                                    print(flag);
                                    Share.share(
                                        'Wallet Address :- $code',
                                        subject: 'Look what I made!');
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          CupertinoIcons.share_up,
                                          size: 25.0,
                                          color: flag[0] == true
                                              ? Colors.white
                                              : AppColors.c00B3DF,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text("Share",
                                              style: AppStyles.font16.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: flag[0] == true
                                                    ? Colors.white
                                                    : AppColors.c00B3DF,
                                              )),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: flag[0] == true
                                          ? AppColors.c00B3DF
                                          : Colors.white,
                                      border: Border.all(
                                          color: AppColors.c00B3DF, width: 2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    flag[1] = true;
                                    flag[0] = false;
                                    print(flag);
                                    setState(() {
                                                        Clipboard.setData(
                                                            new ClipboardData(
                                                                text:
                                                                    code));
                                                        //Copied to Clipboard

                                                        Scaffold.of(context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                          content: Text(
                                                              "Copied to Clipboard."),
                                                        ));
                                                      });
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.content_copy,
                                          size: 25.0,
                                          color: flag[1] == true
                                              ? Colors.white
                                              : AppColors.c00B3DF,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text("copy",
                                              style: AppStyles.font16.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: flag[1] == true
                                                    ? Colors.white
                                                    : AppColors.c00B3DF,
                                              )),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: flag[1] == true
                                          ? AppColors.c00B3DF
                                          : Colors.white,
                                      border: Border.all(
                                          color: AppColors.c00B3DF, width: 2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}
