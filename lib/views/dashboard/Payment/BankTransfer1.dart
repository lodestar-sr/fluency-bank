import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/components/verification_code_input.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class BankTransfer1 extends StatefulWidget {
  BankTransfer1({Key key}) : super(key: key);

  @override
  _BankTransfer1State createState() => _BankTransfer1State();
}

class _BankTransfer1State extends State<BankTransfer1> {
  var currencyamountController = MoneyMaskedTextController(
      leftSymbol: '£', decimalSeparator: '.', thousandSeparator: ',');
  bool canContinue = false;
  var transferfee = "£0.00";
  bool obscurePasscode = false;
  bool confirmPassword = false;

  //Confirm Payment
  onTogglePasscode() {
    setState(() {
      obscurePasscode = !obscurePasscode;
    });
  }
  completeInputCode(String code) {

    print("This is the code ${code.length}");
    if (code.length == 4) {
      setState(() {
        confirmPassword = true;
      });
      
    } else {
      confirmPassword = false;
    }
  }

  @override
  void initState() {
    super.initState();
    currencyamountController.addListener(validator);
  }

  void validator() {
    var currencyinserted = currencyamountController.text;
    print(currencyinserted);
    if (currencyinserted != "£0.00" && currencyinserted != "£0") {
      setState(() {
        canContinue = true;
        transferfee = "£4.99";
      });
    } else {
      setState(() {
        canContinue = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Bank transfer",
                    style: AppStyles.font20,
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
                      onTap: () =>
                          FocusScope.of(context).requestFocus(new FocusNode()),
                      child: SingleChildScrollView(
                          child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: viewportConstraints.maxHeight,
                              ),

                              //Removed Intrinsic height
                              child: Container(
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Text("Recipient",
                                                  style: AppStyles.font18
                                                      .copyWith(
                                                          color:
                                                              Colors.grey[600],
                                                          fontWeight:
                                                              FontWeight.w500)),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 20.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Colors.grey[100]),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
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
                                                            child: Icon(
                                                              Icons
                                                                  .account_balance,
                                                              color: Colors
                                                                  .grey[700],
                                                            ),
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
                                                                Text(
                                                                    "Helena Brauer : GBP",
                                                                    style: AppStyles
                                                                        .font20
                                                                        .copyWith(
                                                                            fontWeight:
                                                                                FontWeight.w500)),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 5.0),
                                                                  child: Text(
                                                                      "Account number: 23242134",
                                                                      style: AppStyles
                                                                          .font18
                                                                          .copyWith(
                                                                              color: Colors.grey[600])),
                                                                ),
                                                                Text(
                                                                    "Sort code: 23-54-65",
                                                                    style: AppStyles
                                                                        .font18
                                                                        .copyWith(
                                                                            color:
                                                                                Colors.grey[600])),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          color:
                                                              Colors.grey[800])
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 20.0),
                                              child: Text("How to send",
                                                  style: AppStyles.font18
                                                      .copyWith(
                                                          color:
                                                              Colors.grey[600],
                                                          fontWeight:
                                                              FontWeight.w500)),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 20.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Colors.grey[100]),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
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
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 5.0),
                                                                  child: Text(
                                                                      "£1,000.00",
                                                                      style: AppStyles
                                                                          .font18
                                                                          .copyWith(
                                                                              color: Colors.grey[600])),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          color:
                                                              Colors.grey[800])
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextFormField(
                                              textAlign: TextAlign.center,
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              style: AppStyles.font32,
                                              cursorWidth: 1,
                                              cursorColor: AppColors.c212121,
                                              controller:
                                                  currencyamountController,
                                              decoration: InputDecoration(
                                                  hintText: "£0",
                                                  labelText: "Amount",
                                                  labelStyle: AppStyles.font20
                                                      .copyWith(
                                                          color:
                                                              Colors.grey[600]),
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 32.0)),
                                            ),
                                            TextField(
                                              maxLines: 3,
                                              style: AppStyles.font18,
                                              decoration: InputDecoration(
                                                  labelText: "Leave comment",
                                                  labelStyle: AppStyles.font20
                                                      .copyWith(
                                                          color:
                                                              Colors.grey[600]),
                                                  border: InputBorder.none),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 100.0),
                                              child: Container(
                                                height: 100,
                                                child: Column(
                                                  children: <Widget>[
                                                    Center(
                                                        child: Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Text(
                                                        "Transfer fee $transferfee",
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
                                                          "Next",
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
                                                            bottomsheet(
                                                                context);
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]))))));
                }))));
  }

  void bottomsheet(BuildContext context) {
    bool toConfirmPayment = true;
    var amount = ["free","£4.99"];
          var days = ["Takes 1-3 days.","Takes 5 minutes."];
          var totalamount;
          var selectedway = "";
          bool canContinueModel = false;
          var enteredamount = currencyamountController.text.substring(1);
          List<bool> check = [false , false];
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        context: context,
        builder: (BuildContext bc) {
          
          

          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Visibility(
              visible: toConfirmPayment,
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
                      Text("Choose transfer method",
                          style: AppStyles.font22
                              .copyWith(fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "You are sending ${currencyamountController.text} to Helena Brauer. You will pay £${totalamount == null ? double.parse(enteredamount)+ 4.99 : totalamount} in total.",
                          style: AppStyles.font16.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top : 30.0),
                        child: RadioButtonGroup(
                          activeColor: AppColors.c00B3DF,
                          labelStyle: AppStyles.font18
                              .copyWith(fontWeight: FontWeight.w500),
                          labels: <String>[
                            "Regular",
                            "Express",
                          ],
                          onSelected: (String selected) {
                            print(selected);
                            setState(() {
                              selectedway = selected;
                              totalamount = selected == "Regular" ? double.parse(enteredamount) + 4.99 : double.parse(enteredamount) + 9.98;
                              canContinueModel = true;
                            });

                          },
                        
                          itemBuilder: (Radio button,Text txt , int i){
                            return Row(
                              children: <Widget>[
                                button,          
                                Expanded(
                                    child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        txt , 
                                        Text("${days[i]}",style:AppStyles.font18.copyWith(color:Colors.grey[500]))
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.c00B3DF),
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top : 5.0,bottom: 5.0,left: 8.0,right: 8.0),
                                    child: Text(amount[i],style:AppStyles.font16.copyWith(color: AppColors.c00B3DF)),
                                  ),
                                )
                              ],
                              
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child:  Container(
                                  margin: EdgeInsets.all(16),
                                  child: RaisedGradientButton(
                                    child: Text(
                                      "Send $selectedway",
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
                                        setState(() {
                                          toConfirmPayment = false;
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

              ////replacement 
              replacement: Padding(
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
                          "You are sending ${currencyamountController.text} to Helena Brauer. You will pay £${totalamount == null ? double.parse(enteredamount)+ 4.99 : totalamount} in total.",
                          style: AppStyles.font16.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500]),
                        ),
                      ),
                      //Passcode
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 45.0),
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
        confirmPassword = true;
      });
      
    } else {
      confirmPassword = false;
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
                                  gradient: confirmPassword
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
                                    if (confirmPassword == true) {
                                      Navigator.of(context).pushNamed("PaymentSuccess",arguments: <String,String>{
                                        'amount' : currencyamountController.text,
                                        'paymenttype' : selectedway,
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
            ),
              
            );
          });
        });
  }
}
