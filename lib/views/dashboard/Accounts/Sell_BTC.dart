import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/components/verification_code_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../theme.dart';

class Sell_BTC extends StatefulWidget {
  Sell_BTC({Key key}) : super(key: key);

  @override
  _Sell_BTCState createState() => _Sell_BTCState();
}

class _Sell_BTCState extends State<Sell_BTC> {
  var currencyfromController = MoneyMaskedTextController(
      leftSymbol: '£', decimalSeparator: '.', thousandSeparator: ',');

  var currencytoController = MoneyMaskedTextController(
      leftSymbol: '₿', decimalSeparator: '.', thousandSeparator: ',');

  String code = '';
  String repeatCode = '';
  bool canContinueModel = false;
  bool canContinue = false;
  bool obscurePasscode = true;
  Widget from ;
  Widget to;
  bool exchange = false;
  


  @override
  void initState() { 
    super.initState();  
     
  }
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

  //Confirm Sell_BTC
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
      canContinueModel = false;
    }
  }

  @override
  Widget build(BuildContext context) {


    if (exchange == false) {
      from = btcWidget();
      to = gbpWidget();
      
    } else {
      to = btcWidget();
      from = gbpWidget();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sell BTC",
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

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
            new BoxShadow(
              color: Colors.grey[300],
              blurRadius: 10.0
            )
          ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                                                child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(top: 24, bottom: 8),
                                  child: LinearPercentIndicator(
                                    lineHeight: 8,
                                    percent: 0.9,
                                    backgroundColor: AppColors.cF9F9F9,
                                    progressColor: AppColors.c24E343,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5,left: 5),
                                  child: Text("£4,567.47 out of £5000.00 remaining",style: AppStyles.font18.copyWith(color: Colors.grey[500]),),
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(top : 8.0,left: 10),
                            child: Text("Increase \nfree limit",style: AppStyles.font18.copyWith(color: AppColors.c00B3DF),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "From",
                    style: AppStyles.font18.copyWith(color: Colors.grey[600]),
                  ),
                ),
              from,

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
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                exchange == false ? exchange = true : exchange = false;
                              });
                            },
                                                      child: Container(
                              height: 45,
                              child: Image.asset("assets/images/change.png"),
                            ),
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
                to,
                
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Exchange fee £0.00",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 16.0,
                                  fontFamily: 'Gilroy')),
                          Container(
                            margin: EdgeInsets.all(16),
                            child: RaisedGradientButton(
                              child: Text(
                                "Exchange",
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

  Widget btcWidget()
  {
    return  Padding(
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
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: true),
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
                                //     .pushNamed('Sell_BTCCurrencyTOoptions');
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
                                            color: Color.fromRGBO(
                                                247, 147, 26, 1),
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
                                    borderRadius:
                                        BorderRadius.circular(10.0)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
  }

  //Gbp Widget 
  Widget gbpWidget()
   {
      return Padding(
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
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: true),
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
                                              style: AppStyles.font20
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600)),
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
                );
   }

  //bottomsheet
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
                      Text("Confirm sell",
                          style: AppStyles.font22
                              .copyWith(fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "You're selling ${currencyfromController.text} to ${currencytoController.text}, from your GBP account to your Btc account",
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
                                onCompleted: (value){
                                  completeInputCode(value);
                                },
                                onChanged: (value){
                                  completeInputCode(value);
                                },
                                
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 24),
                                child: GestureDetector(
                                  child: Image.asset(
                                    obscurePasscode ? 'assets/images/eye-gray.png' : 'assets/images/eye-black.png',
                                    width: 26,
                                  ),
                                  onTap: (){
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
                                    "Sell Now",
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
                                      Navigator.of(context).pushNamed('ExchangeSuccess',arguments: <String,String>{
                                        "convertfrom" : '${currencyfromController.text}',
                                        "convertto" : '${currencytoController.text}',
                                        "from" : "buybtc",
                                      });
                                    }
                                  },
                                ),
                              )
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}
