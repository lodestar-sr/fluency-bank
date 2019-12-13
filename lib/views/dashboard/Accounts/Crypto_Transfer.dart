import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/components/verification_code_input.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Crypto_Transfer extends StatefulWidget {
  Crypto_Transfer({Key key}) : super(key: key);

  @override
  _Crypto_TransferState createState() => _Crypto_TransferState();
}

class _Crypto_TransferState extends State<Crypto_Transfer> {
  var poundsController = MoneyMaskedTextController(
      leftSymbol: '£', decimalSeparator: '.', thousandSeparator: ',');

  var bitcoinController = MoneyMaskedTextController(
      leftSymbol: '₿', decimalSeparator: '.', thousandSeparator: ',');
  bool isCompany = false;
  String barcode = "Wallet address";
  bool bitcoin = true;
  bool pounds = false;
  bool canContinue = false;
  @override
  void initState() { 
    super.initState();
    poundsController.addListener(validator);
    bitcoinController.addListener(validator);
    
  }
  @override
  void dispose() { 
    poundsController.dispose();
    bitcoinController.dispose();
    super.dispose();
  }
  void validator() {
    var bitcoincurrency = bitcoinController.text;
    var poundscurrency = poundsController.text;  
    if (poundscurrency != "£0.00" && poundscurrency != "£0" && bitcoincurrency != "₿0.00" && bitcoincurrency != "₿0" && barcode != "Wallet address") {
      setState(() {
        canContinue = true;
      });
    } else {
      setState(() {
        canContinue = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    validator();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Crypto Transfer",
            style: AppStyles.font18,
          ),
          centerTitle: true,
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
                      child: Container(
                          color: Colors.white,
                          width: double.infinity,
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Recipient",
                                      style: AppStyles.font18.copyWith(
                                          color: Colors.grey[600]),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[200],
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.all(15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            color:
                                                                Colors.grey[
                                                                    500]))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15.0,
                                                          bottom: 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: <Widget>[
                                                      Expanded(
                                                          child: Text(
                                                              "$barcode",
                                                              style: barcode ==
                                                                      "Wallet address"
                                                                  ? AppStyles
                                                                      .font16
                                                                      .copyWith(
                                                                          color: Colors.grey[
                                                                              500])
                                                                  : AppStyles
                                                                      .font18)),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            scan();
                                                            //TODO:- ADD permission for camera in ios
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 30,
                                                          width: 30,
                                                          child: Image.asset(
                                                              "assets/images/crypto-scan.png"),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 15.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    Expanded(
                                                        child: Text(
                                                            "Is this a company?",
                                                            style: AppStyles
                                                                .font18
                                                                .copyWith(
                                                                    color: Colors
                                                                        .grey[500]))),
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      child:
                                                          CupertinoSwitch(
                                                        value: isCompany,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            isCompany =
                                                                value;
                                                          });
                                                        },
                                                        activeColor:
                                                            Colors.green,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 30),
                                      child: Text(
                                        "How to send",
                                        style: AppStyles.font18.copyWith(
                                            color: Colors.grey[600]),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[200],
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.all(10.0),
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
                                                  padding: EdgeInsets.only(
                                                      left: 8),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text("BTC",
                                                          style: AppStyles
                                                              .font18
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 5),
                                                        child: Text(
                                                          "₿0.1032",
                                                          style: AppStyles
                                                              .font18
                                                              .copyWith(
                                                                  color: Colors
                                                                          .grey[
                                                                      600]),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "₿1=£9265.40",
                                                style: AppStyles.font18
                                                    .copyWith(
                                                        color: Colors
                                                            .grey[600]),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10),
                                                child: Icon(Icons
                                                    .keyboard_arrow_down),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 30),
                                      child: Text(
                                        "Amount",
                                        style: AppStyles.font18.copyWith(
                                            color: Colors.grey[600]),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 40),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  
                                                  pounds == false ? pounds = true : pounds = false;
                                                  bitcoin == false ? bitcoin = true : bitcoin = false;
                                                });
                                              },
                                              child: Container(
                                                height: 45,
                                                child: Image.asset(
                                                    "assets/images/change.png"),
                                              ),
                                            ),
                                            Expanded(
                                                child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Container(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            border: Border(
                                                                bottom: BorderSide(
                                                                    color: Color.fromRGBO(
                                                                        0,
                                                                        225,
                                                                        225,
                                                                        1)))),
                                                        child: //
                                                      TextField(
                                                        enabled:bitcoin,
                                                        onChanged: (value) {
                                                          validator();
                                                        },
                                                        textAlign: TextAlign.center,
                                                        controller:
                                                            bitcoinController,
                                                        keyboardType:
                                                            TextInputType
                                                                .numberWithOptions(
                                                                    decimal:
                                                                        true),
                                                        style:
                                                           bitcoin == false? AppStyles.font24.copyWith( color: Colors
                                                                        .grey[
                                                                    600],) : AppStyles.font32.copyWith(fontWeight: FontWeight.w600),
                                                        cursorWidth: 1,
                                                        cursorColor:
                                                            AppColors.c212121,
                                                        decoration: InputDecoration(
                                                           border: InputBorder.none,
                                                            hintText: "₿0",
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                        .grey[
                                                                    600],
                                                                fontSize:
                                                                    35.0)),
                                                      ),
                                                      ),
                                                      TextField(
                                                          enabled:pounds,
                                                          onChanged: (value) {
                                                             validator();
                                                          },
                                                          textAlign: TextAlign.center,
                                                          controller:
                                                              poundsController,
                                                          
                                                          keyboardType:
                                                              TextInputType
                                                                  .numberWithOptions(
                                                                      decimal:
                                                                          true),
                                                          style: pounds== false? AppStyles.font24.copyWith( color: Colors
                                                                        .grey[
                                                                    600],) : AppStyles.font32.copyWith(fontWeight: FontWeight.w600),
                                                          cursorWidth: 1,
                                                          cursorColor:
                                                              AppColors
                                                                  .c212121,
                                                          decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                              hintText: "£0",
                                                              hintStyle: TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      600],
                                                                  fontSize:
                                                                      35.0)),
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
                                    ///////bottom
                                               Padding(
                                                 padding: const EdgeInsets.only(top : 40.0),
                                                 child: Container(                                              
                                                  child: Column(
                                                    children: <Widget>[
                                                      Center(
                                                          child: Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Text(
                                                          "Transfer fee ₿0.00",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[500],
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontFamily:
                                                                  'Gilroy'),
                                                        ),
                                                      )),
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(16),
                                                        child:
                                                            RaisedGradientButton(
                                                          child: Text(
                                                            "Confirm",
                                                            style: AppStyles
                                                                .buttonTextStyle,
                                                          ),
                                                          gradient: canContinue
                                                              ? LinearGradient(
                                                                  colors: [
                                                                    AppColors
                                                                        .c00B3DF,
                                                                    AppColors
                                                                        .c00B3DF
                                                                  ],
                                                                  begin: Alignment
                                                                      .topCenter,
                                                                  end: Alignment
                                                                      .bottomCenter,
                                                                )
                                                              : LinearGradient(
                                                                  colors: [
                                                                    AppColors
                                                                        .cBDBDBD,
                                                                    AppColors
                                                                        .cBDBDBD
                                                                  ],
                                                                  begin: Alignment
                                                                      .topCenter,
                                                                  end: Alignment
                                                                      .bottomCenter,
                                                                ),
                                                          onPressed: () {
                                                            if (canContinue ==
                                                                true) {
                                                              bottomsheet(context);
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ),
                                               ),
                                  ]))))));
        }));
  }

  //Barcode Scan
  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }


  //passwordBottom Sheet
  void bottomsheet(BuildContext context) {
    var canContinueModel = false;
    var obscurePasscode = false;
    var amountString = poundsController.text.substring(1);
    var amountdouble = double.parse(amountString) + 9.98;
    //Confirm exchange
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
                      Text("Confirm payment",
                          style: AppStyles.font22
                              .copyWith(fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "You're sending ${poundsController.text} to Helena Brauer, you will pay £$amountdouble in total",
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
                                  if (value.length == 4) {
      setState(() {
        canContinueModel = true;
      });
      
    } else {
      canContinueModel = false;
    }
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
                                    "Confirm",
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
                                      Navigator.of(context).pushNamed('Crypto_TransSuccess',arguments: <String,String>{
                                        "BitcoinAmount" : '${bitcoinController.text}',
                                        "PoundsAmount" : '${poundsController.text}',
                                        "barcode": barcode,
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
