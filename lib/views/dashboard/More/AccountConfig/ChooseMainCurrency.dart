import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:flutter/material.dart';

import '../../../theme.dart';


class ChoosemainCurrency extends StatefulWidget {
  ChoosemainCurrency({Key key}) : super(key: key);

  @override
  _ChoosemainCurrencyState createState() => _ChoosemainCurrencyState();
}

class _ChoosemainCurrencyState extends State<ChoosemainCurrency> {
  
  
  
  var currency = ["AED", "AUD","CAD","CHF","CKZ","DKK","HKD"];
  var currencyname = ["Emirati Dirham", "Australian Dollar", "Canadian Dollar","Swiss Franc","Czech Koruna","Danish Krone","Hong Kong Dollar"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.error_outline, color: Colors.black,size: 25.0,),
            onPressed: () {
              bottomsheet(context);
            },
          )
        ],
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
              child: Text("Choose main currency",
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
              padding: EdgeInsets.only(top: 18, left: 13.0, right: 12.0),
              child: Text(
                    "Accounts",
                    style: TextStyle(color: Colors.grey[700], fontSize: 20),
                  ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18, left: 20.0, right: 12.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                              height: 50.0,
                              width: 50.0,
                              child: Image.asset(
                                "assets/images/eng.png",
                                fit: BoxFit.cover,
                              )),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left :10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("GBP",style: AppStyles.font20.copyWith(
                                          fontWeight: FontWeight.w600)),
                                          Text("Great Britain Pound",style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 18.0))
                                    ],
                                  ),
                                ),
                              )
                  ],
                ),
              ),
            ),

            // currency
            Padding(
              padding: EdgeInsets.only(top: 18, left: 12.0, right: 12.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Other Currencies",
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
                              height: 50.0,
                              width: 50.0,
                              child: Image.asset(
                                "assets/images/${currency[index]}.png",
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
                                      style: AppStyles.font20.copyWith(
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

  void bottomsheet(BuildContext context) {
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Container(
              height: 400.0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
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
                    Text("Main currency",
                        style: AppStyles.font22
                            .copyWith(fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Text(
                        "This is the currency that will be the main reference for the exchange rate. The total balance will be calculated in that currency.",
                        style: AppStyles.font16
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Container(
                        margin: EdgeInsets.all(16),
                        child: RaisedGradientButton(
                          child: Text(
                            "Ok,I understand",
                            style: AppStyles.buttonTextStyle,
                          ),
                          gradient: LinearGradient(
                            colors: [AppColors.c00B3DF, AppColors.c00B3DF],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }
}
