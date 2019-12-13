import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/components/verification_code_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../theme.dart';

class Buy_BTC extends StatefulWidget {
  Buy_BTC({Key key}) : super(key: key);

  @override
  _Buy_BTCState createState() => _Buy_BTCState();
}

class _Buy_BTCState extends State<Buy_BTC> {
  var currencyfromController = MoneyMaskedTextController(
      leftSymbol: '£', decimalSeparator: '.', thousandSeparator: ',');

  var currencytoController = MoneyMaskedTextController(
      leftSymbol: '₿', decimalSeparator: '.', thousandSeparator: ',');

  String code = '';
  String repeatCode = '';
  bool canContinueModel = false;
  bool canContinue = false;
  bool obscurePasscode = true;

  void validator() {
    var currencyfrominserted = currencyfromController.text;
    var currencytoinserted = currencytoController.text;

    if (currencyfrominserted != "£0.00" &&
        currencyfrominserted != "£0" &&
        currencytoinserted != "£0.00" &&
        currencytoinserted != "£0") {
      setState(() {
        canContinue = true;
      });
    } else {
      setState(() {
        canContinue = false;
      });
    }
  }

  //Confirm Buy_BTC
  onTogglePasscode() {
    setState(() {
      obscurePasscode = !obscurePasscode;
    });
  }

  completeInputCode(String code) {
    print("This is the code ${code.length}");
    if (code.length == 4) {
      setState(() {
        canContinueModel = true;
      });
    } else {
      setState(() {
        canContinueModel = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buy BTC",
          style: AppStyles.font20,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.black,
            size: 30.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 90,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "From",
                    style: AppStyles.font18.copyWith(color: Colors.grey[600]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              validator();
                            },
                            controller: currencyfromController,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            style: AppStyles.font32,
                            cursorWidth: 1,
                            cursorColor: AppColors.c212121,
                            decoration: InputDecoration(
                                hintText: "£0",
                                hintStyle: TextStyle(
                                    color: Colors.grey[600], fontSize: 35.0)),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Container(
                              height: 60.0,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                              image: ExactAssetImage(
                                                  "assets/images/eng.png"))),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        //mainAxisAlignment:
                                        //MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text("GBP",
                                              style: AppStyles.font20.copyWith(
                                                  fontWeight: FontWeight.w600)),
                                          Text(
                                            "£1,000.00",
                                            style: TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 16.0,
                                                fontFamily: 'Gilroy'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_down,
                                      color: Colors.black)
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //Echnage

                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Spacer(),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Container(
                            height: 45,
                            child: Image.asset("assets/images/change.png"),
                          ),
                        ),
                        Spacer(),
                        RichText(
                          text: TextSpan(
                            text: '£9,331.00 = ',
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 16.0,
                                fontFamily: 'Gilroy'),
                            children: <TextSpan>[
                              TextSpan(
                                text: '₿1',
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 16.0,
                                    fontFamily: 'Gilroy'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //to
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "To",
                    style: AppStyles.font18.copyWith(color: Colors.grey[600]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: currencytoController,
                            onChanged: (value) {
                              validator();
                            },
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            style: AppStyles.font32,
                            cursorWidth: 1,
                            cursorColor: AppColors.c212121,
                            decoration: InputDecoration(
                                hintText: "£0",
                                hintStyle: TextStyle(
                                    color: Colors.grey[600], fontSize: 35.0)),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.of(context)
                                //     .pushNamed('Buy_BTCCurrencyTOoptions');
                              },
                              child: Container(
                                height: 60.0,
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color:
                                                Color.fromRGBO(247, 147, 26, 1),
                                            image: DecorationImage(
                                                image: ExactAssetImage(
                                                    "assets/images/BTC.png"))),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("BTC",
                                                style: AppStyles.font20
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                            Text(
                                              "₿0.00",
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontSize: 16.0,
                                                  fontFamily: 'Gilroy'),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_down,
                                        color: Colors.black)
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Buy BTC fee £0.00",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 16.0,
                                  fontFamily: 'Gilroy')),
                          Container(
                            margin: EdgeInsets.all(16),
                            child: RaisedGradientButton(
                              child: Text(
                                "Buy BTC",
                                style: AppStyles.buttonTextStyle,
                              ),
                              gradient: canContinue
                                  ? LinearGradient(
                                      colors: [
                                        AppColors.c00B3DF,
                                        AppColors.c00B3DF
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    )
                                  : LinearGradient(
                                      colors: [
                                        AppColors.cBDBDBD,
                                        AppColors.cBDBDBD
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                              onPressed: () {
                                if (canContinue == true) {
                                  bottomsheet(context);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void bottomsheet(BuildContext context) {
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                height: 400.0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
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
                      Text("Confirm Buy",
                          style: AppStyles.font22
                              .copyWith(fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "You're exchanging ${currencyfromController.text} to ${currencytoController.text}, from you GBP account to your Btc account",
                          style: AppStyles.font16.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500]),
                        ),
                      ),
                      //Passcode
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              VerificationCodeInput(
                                  keyboardType: TextInputType.number,
                                  itemWidth: 40,
                                  itemHeight: 56,
                                  itemGap: 8,
                                  separateMiddle: false,
                                  obscure: obscurePasscode,
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                  onCompleted: completeInputCode,
                                  onChanged: (value) {
                                    if (code.length == 4) {
                                      setState(() {
                                        canContinueModel = true;
                                      });
                                    } else {
                                      setState(() {
                                        canContinueModel = false;
                                      });
                                    }
                                  }),
                              Container(
                                margin: EdgeInsets.only(left: 24),
                                child: GestureDetector(
                                  child: Image.asset(
                                    obscurePasscode
                                        ? 'assets/images/eye-gray.png'
                                        : 'assets/images/eye-black.png',
                                    width: 26,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      onTogglePasscode();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Container(
                            margin: EdgeInsets.all(16),
                            child: RaisedGradientButton(
                              child: Text(
                                "Buy Now",
                                style: AppStyles.buttonTextStyle,
                              ),
                              gradient: canContinueModel
                                  ? LinearGradient(
                                      colors: [
                                        AppColors.c00B3DF,
                                        AppColors.c00B3DF
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    )
                                  : LinearGradient(
                                      colors: [
                                        AppColors.cBDBDBD,
                                        AppColors.cBDBDBD
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                              onPressed: () {
                                if (canContinueModel == true) {
                                  Navigator.of(context).pushNamed(
                                      'ExchangeSuccess',
                                      arguments: <String, String>{
                                        "convertfrom":
                                            '${currencyfromController.text}',
                                        "convertto":
                                            '${currencytoController.text}',
                                        "from": "buybtc",
                                      });
                                }
                              },
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}
