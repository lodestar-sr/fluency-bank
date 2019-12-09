//Buy_Crypto

import 'package:flutter/material.dart';

import '../../theme.dart';

class Buy_Crypto extends StatefulWidget {
  Buy_Crypto({Key key}) : super(key: key);

  @override
  Buy_Cryptostate createState() => Buy_Cryptostate();
}

class Buy_Cryptostate extends State<Buy_Crypto> {
  var header = ["Cryptocurrencies", "Currencies"];
  var cryp = ["BTC", "LTC", "ETH", "BCH", "XRP"];
  var cryptype = ["Bitcoin", "Litecoin", "Ethereum", "Bitcoin Cash", "Ripple"];
  var moneytitle = [
    "Buy BTC",
    "Activate for",
    "Activate for",
    "Activate for",
    "Activate for",
  ];
  var money = ["", "£4.99", "£4.99", "£4.99", "£4.99"];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Choose source",
                  style: AppStyles.font28.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 12.0, right: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[100],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey[400])),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18, left: 12.0, right: 12.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "${header[0]}",
                        style: TextStyle(color: Colors.grey[700], fontSize: 20),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 18.0,
                      ),
                      child: Container(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cryp.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                // Navigator.of(context).pushNamed('account_created',
                                //     arguments: <String, String>{
                                //       "cryncurrency": cryp[index],
                                //       "cryncurrencyname":cryptype[index],
                                //       "money": money[index],
                                //       "count": index.toString() ,
                                //     });
                               index == 0 ? Navigator.of(context).pushNamed("Buy_BTC"): Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 50.0,
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            //color: Color.fromRGBO(97, 58, 10, 1),
                                            color: index == 0
                                                ? Color.fromRGBO(
                                                    247, 147, 26, 1)
                                                : index == 3
                                                    ? Color.fromRGBO(
                                                        141, 195, 81, 1)
                                                    : Colors.white,
                                            image: DecorationImage(
                                                image: ExactAssetImage(
                                                    "assets/images/${cryp[index] ?? ""}.png"),
                                                fit: BoxFit.contain)),
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
                                              Text("${cryp[index] ?? ""}",
                                                  style: AppStyles.font22
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                              Text(
                                                "${cryptype[index] ?? ""}",
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
                                            Text("${moneytitle[index]}",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: index == 0 ? AppColors.c00B3DF: Colors.grey[500],
                                                    fontSize: 20.0)),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Text(
                                                "${money[index]}",
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
                              ),
                            );
                          },
                        ),
                      )),
                ],
              ),
            ),

            
           
          ],
        ),
      ),
    );
  }
}
