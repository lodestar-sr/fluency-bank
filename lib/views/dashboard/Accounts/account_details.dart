import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../../theme.dart';

class Account_details extends StatefulWidget {
  Account_details({Key key}) : super(key: key);

  @override
  Account_detailsState createState() => Account_detailsState();
}

class Account_detailsState extends State<Account_details> {
  var flag = [false, false];
  var currencyText;
  var amount;
  var heading = ["Account Details", "Statement"];
  var subheading = [
    "Account number,sort code,IBAN,SWIFT/BIC",
    "Send via email as a PDF or Excel file"
  ];
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
      //Appbar
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            //currency details
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("$currencyText account",
                            style: TextStyle(
                                fontFamily: 'Gilroy',
                                color: Colors.grey[500],
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600)),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "£$amount",
                            style: AppStyles.font32
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 75.0,
                      width: 75.0,
                      child: Image.asset("assets/images/eng.png"),
                    ),
                  )
                ],
              ),
            ),

            // Account details and statement

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey[400],
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        index == 0 ? ModalBottomSheet(context, currencyText) : null ;
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("${heading[index]}",
                                      style: AppStyles.font18.copyWith(
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      "${subheading[index]}",
                                      style: AppStyles.font16
                                          .copyWith(color: Colors.grey[500]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 2.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      top: BorderSide(color: Colors.grey[400], width: 0.5),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 2.0, top: 10.0, right: 8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.black,
                              size: 38.0,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Top Up",
                                      style: AppStyles.font18.copyWith(
                                          fontWeight: FontWeight.w600)),
                                  Text("You'll immediately top up this account",
                                      style: AppStyles.font16
                                          .copyWith(color: Colors.grey[500])),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ),

            // Send money

            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 2.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                    child: Padding(
                  padding:
                      const EdgeInsets.only(left: 2.0, top: 10.0, right: 8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300],
                        ),
                        child: Transform.rotate(
                            angle: 13.5,
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.black,
                              size: 38.0,
                            )),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Send money",
                                  style: AppStyles.font18
                                      .copyWith(fontWeight: FontWeight.w600)),
                              Text("Choose recipient and send money",
                                  style: AppStyles.font16
                                      .copyWith(color: Colors.grey[500])),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
              ),
            ),

            ///////
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Container(
                
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.grey[100],
                    ]
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: 5.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[350],
                          ),
                        ),
                      ),
                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("2019",
                                  style: AppStyles.font18
                                      .copyWith(color: Colors.grey[700])),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text("1-25 August",
                                    style: AppStyles.font22
                                        .copyWith(fontWeight: FontWeight.w500)),
                              )
                            ],
                          )),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.search,
                              size: 35.0,
                              color: Colors.grey[800],
                            ),
                          )
                        ],
                      ),

                      //
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: RichText(
                          text: TextSpan(
                            style: AppStyles.font18
                                .copyWith(color: Colors.grey[700]),
                            text: "This month you have ",
                            children: [
                              TextSpan(
                                  text: '£$amount.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[600])),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 50.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 227, 227, 1),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.remove,
                                    size: 35.0,
                                    color: Color.fromRGBO(255, 116, 119, 1),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("£0.00",
                                          style: AppStyles.font22.copyWith(
                                              fontWeight: FontWeight.w500)),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          "Spent",
                                          style: AppStyles.font18.copyWith(
                                              color: Colors.grey[700]),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 50.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(211, 249, 217, 1),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    size: 35.0,
                                    color: Color.fromRGBO(36, 227, 67, 1),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("£${amount}",
                                          style: AppStyles.font22.copyWith(
                                              fontWeight: FontWeight.w500)),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          "Recieved",
                                          style: AppStyles.font18.copyWith(
                                              color: Colors.grey[700]),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      
                    ],
                  ),
                ),
              ),
            ),
            ////Todayy
                      Padding(
                        padding: EdgeInsets.only(top: 15.0, left: 12.0 , right: 12.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Expanded(
                                                                  child: Text("Today",
                                      style: AppStyles.font22
                                          .copyWith(fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                    "+£${amount}",
                                    style: TextStyle(
                                        color: AppColors.c24E343,
                                        fontSize: 22,
                                        fontFamily: 'Gilroy'),
                                  )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0 , bottom: 8.0),
                              child: Container(
                                height: 0.5,
                                color: Colors.grey[350],
                              ),
                            ),
/////
                            Container(
                              child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 60.0,
                                        width: 60.0,
                                        child: Center(
                                          child: SizedBox(
                                            height: 30.0,
                                            width: 30.0,
                                            child: Image.asset("assets/images/arrow.png")),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Colors.grey[200],
                                            
                                            
                                      ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Text("*4664 -> ${currencyText}",
                                                  style: AppStyles.font22
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                              Text(
                                                "10:43 pm",
                                                style: TextStyle(
                                                    color: Colors.grey[500],
                                                    fontSize: 18.0),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text("+£$amount",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: AppColors.c24E343,
                                                    fontSize: 20.0,fontWeight: FontWeight.bold)),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Text(
                                                "Vis *4664",
                                                textAlign: TextAlign.end,
                                                style: AppStyles.font16
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                            ),
                            Container(
                              height: 50.0,
                            )
                          ],
                        ),
                      )
          ],
        ),
      ),
    );
  }

  //Bottom sheet
  void ModalBottomSheet(context, String accounttype) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Container(
              child: new Column(
                //mainAxisAlignment: MainAxisAlignment.center,
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
                        padding: const EdgeInsets.only(top: 15.0, left: 12.0),
                        child: Text("Your $accounttype account details",
                            style: AppStyles.font24
                                .copyWith(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, left: 12.0),
                        child: Text("Account number",
                            style: AppStyles.font16.copyWith()),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 12.0),
                        child: Text("25443658",
                            style: AppStyles.font24.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 18.0)),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 23.0, left: 12.0),
                        child: Text("Sort code",
                            style: AppStyles.font16.copyWith()),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 12.0),
                        child: Text("08-90-90",
                            style: AppStyles.font24.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 18.0)),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 23.0, left: 12.0),
                        child: Text("IBAN", style: AppStyles.font16.copyWith()),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 12.0),
                        child: Text("GB29 NWBK 6016 1331 9268 19",
                            style: AppStyles.font24.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 18.0)),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 23.0, left: 12.0),
                        child: Text("SWIFT/BIC",
                            style: AppStyles.font16.copyWith()),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 12.0),
                        child: Text("SREDF344G",
                            style: AppStyles.font24.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 18.0)),
                      ),
                    ],
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
                                    'check out my website https://example.com',
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
            );
          });
        });
  }
}
