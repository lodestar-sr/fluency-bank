import 'dart:collection';

import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class TopUpAccount extends StatefulWidget {
  TopUpAccount({Key key}) : super(key: key);

  @override
  _TopUpAccountState createState() => _TopUpAccountState();
}

class _TopUpAccountState extends State<TopUpAccount> {
  var currencyText = "";
  var amount = "";
  bool canContinue = false;
  TextEditingController currencyamountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    currencyamountController.addListener(validator);
  }

  @override
  void dispose() {
    currencyamountController.dispose();
    super.dispose();
  }

  void validator() {
    var currencyinserted = currencyamountController.text;
    if (currencyinserted == 0) {
      setState(() {
        canContinue = true;
      });
    } else {
      setState(() {
        canContinue = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //currencyText
    final LinkedHashMap<String, String> args =
        ModalRoute.of(context).settings.arguments;
    setState(() {
      currencyText = args['currencyText'];
      amount = args['amount'];
      print("This is the $currencyText and $amount");
    });
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.error_outline, color: Colors.grey[600]),
            onPressed: () {
              bottomsheet(context);
            },
          )
        ],
        title: Text("Top up account", style: AppStyles.font20),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SafeArea(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: SingleChildScrollView(
              //FIXME:check with devices
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text(
                            "Choose account",
                            style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 16.0,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[100]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0,
                                  left: 8.0,
                                  right: 10.0,
                                  bottom: 12.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 40.0,
                                    width: 40.0,
                                    child: Image.asset("assets/images/eng.png"),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("$currencyText",
                                              style: AppStyles.font20.copyWith(
                                                  fontWeight: FontWeight.w500)),
                                          Text(
                                            "$amount",
                                            style: TextStyle(
                                                color: Colors.grey[500],
                                                fontFamily: 'Gilroy',
                                                fontSize: 16.0),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_down,
                                      color: Colors.black)
                                ],
                              ),
                            ),
                          ),
                        ),

                        //topupmethod
                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text(
                            "Select top up method",
                            style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 16.0,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[100]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0,
                                  left: 8.0,
                                  right: 10.0,
                                  bottom: 12.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 40.0,
                                    width: 40.0,
                                    child:
                                        Image.asset("assets/images/master.png"),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("*4322",
                                              style: AppStyles.font20.copyWith(
                                                  fontWeight: FontWeight.w500)),
                                          Text(
                                            "Bank of America",
                                            style: TextStyle(
                                                color: Colors.grey[500],
                                                fontFamily: 'Gilroy',
                                                fontSize: 16.0),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_down,
                                      color: Colors.black)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text(
                            "Top up amount",
                            style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 16.0,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        ////Amount

                        Expanded(
                          flex: 1,
                          child: Form(
                            child: TextFormField(
                              
                              textAlign: TextAlign.center,
                              onFieldSubmitted: (term) {
                                _formKey.currentState.validate();
                              },
                              keyboardType: TextInputType.phone,
                              style: AppStyles.font32,
                              cursorWidth: 1,
                              cursorColor: AppColors.c212121,
                              validator: (value) {
                                if (value == 0) {
                                  return "Please enter valid amount";
                                }
                              },
                              controller: currencyamountController,
                              decoration: InputDecoration(
                                  hintText: "£0",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[600], fontSize: 32.0)),
                            ),
                          ),
                        ),
                        //Top up Button
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              children: <Widget>[
                                Center(
                                    child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "Top up fee £0.00",
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Gilroy'),
                                  ),
                                )),
                                Container(
                                  margin: EdgeInsets.all(16),
                                  child: RaisedGradientButton(
                                    child: Text(
                                      "Top Up",
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
                                        Navigator.of(context)
                                            .pushNamed('statementsent');
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      })),
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
                    Text("Top up account",
                        style: AppStyles.font22
                            .copyWith(fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Text(
                        "Top up your fiat Fluency accounts using your existing debit or credit card. We currently support Visa and Mastercard cards. Card details are saved securely.You must add fiat money in the currency that your bank account is in.",
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
                            "Top up",
                            style: AppStyles.buttonTextStyle,
                          ),
                          gradient: LinearGradient(
                            colors: [AppColors.c00B3DF, AppColors.c00B3DF],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          onPressed: () {
                            //     var count = 0;
                            //     Navigator.popUntil(context, (route) {
                            //   return count++ == 3;
                            // });
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
