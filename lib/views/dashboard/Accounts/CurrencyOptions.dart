import 'package:flutter/material.dart';

import '../../theme.dart';

class ExchangeCurrencyTOoptions extends StatefulWidget {
  ExchangeCurrencyTOoptions({Key key}) : super(key: key);

  @override
  ExchangeCurrencyTOoptionsstate createState() => ExchangeCurrencyTOoptionsstate();
}

class ExchangeCurrencyTOoptionsstate extends State<ExchangeCurrencyTOoptions> {
  var header = ["Cryptocurrencies", "Currencies"];
  var cryp = ["BTC", "LTC", "ETH", "BCH", "XRP"];
  var cryptype = ["Bitcoin", "Litecoin", "Ethereum", "Bitcoin Cash", "Ripple"];
  var moneytitle = [
    "Activate for Free",
    "Activate for",
    "Activate for",
    "Activate for",
    "Activate for",
  ];
  var money = ["", "£4.99", "£4.99", "£4.99", "£4.99"];
  var currency = ["AED", "AUD", "CAD"];
  var currencyname = ["Emirati Dirham", "Australian Dollar", "Canadian Dollar"];

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
              child: Text("What currency do you want to exchange?",
                  style: AppStyles.font24.copyWith(
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
                                Navigator.of(context).pushNamed('account_created',
                                    arguments: <String, String>{
                                      "cryncurrency": cryp[index],
                                      "cryncurrencyname":cryptype[index],
                                      "money": money[index],
                                      "count": index.toString() ,
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 60.0,
                                        width: 60.0,
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
                                                    "assets/images/cryp${index + 1}.png"),
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
                                              Text("${cryp[index]}",
                                                  style: AppStyles.font22
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                              Text(
                                                "${cryptype[index]}",
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
                                                    color: Colors.grey[500],
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

            // currency
            Padding(
              padding: EdgeInsets.only(top: 18, left: 12.0, right: 12.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "${header[1]}",
                    style: TextStyle(color: Colors.grey[700], fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0, left: 12.0, right: 12.0),
              child: Container(
                  child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: currency.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                              height: 60.0,
                              width: 60.0,
                              child: Image.asset(
                                "assets/images/cu${index + 1}.png",
                                fit: BoxFit.cover,
                              )),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text("${currency[index]}",
                                      style: AppStyles.font22.copyWith(
                                          fontWeight: FontWeight.w600)),
                                  Text(
                                    "${currencyname[index]}",
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 18.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
            )
          ],
        ),
      ),
    );
  }
}
