import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/components/verification_code_input.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login_Security extends StatefulWidget {
  Login_Security({Key key}) : super(key: key);

  @override
  _Login_SecurityState createState() => _Login_SecurityState();
}

class _Login_SecurityState extends State<Login_Security> {
  bool fingerprintcheck = false;
  bool faceidcheck = false;
  bool obscurePasscode = true;
  bool canContinueModel = false;
  bool confirmpasscode = false;


  //Toggle password state 
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
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: LayoutBuilder(
                builder: (BuildContext context,
                        BoxConstraints viewportConstraints) =>
                    Scaffold(
                        appBar: AppBar(
                          centerTitle: true,
                          elevation: 0.0,
                          backgroundColor: Colors.white,
                          leading: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                        body: GestureDetector(
                            onTap: () => FocusScope.of(context)
                                .requestFocus(new FocusNode()),
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
                                                Text(
                                                  "Login and Security",
                                                  style: AppStyles.font28
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 45.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      bottomsheet(context);
                                                    },
                                                    child: Container(
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
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                    "Change PIN code",
                                                                    style: AppStyles
                                                                        .font18
                                                                        .copyWith(
                                                                            fontWeight:
                                                                                FontWeight.w500)),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 8.0),
                                                                  child: Text(
                                                                      "You will use it to sign in and for payments.",
                                                                      style: AppStyles
                                                                          .font16
                                                                          .copyWith(
                                                                              color: Colors.grey[500])),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Icon(
                                                              Icons
                                                                  .keyboard_arrow_right,
                                                              size: 30,
                                                              color: Colors
                                                                  .grey[500])
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0),
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        top: 10.0,
                                                        bottom: 10.0),
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            top: BorderSide(
                                                                color: Colors
                                                                    .grey[200],
                                                                width: 1),
                                                            bottom: BorderSide(
                                                                color: Colors
                                                                    .grey[200],
                                                                width: 1))),
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
                                                              Text(
                                                                  "Use fingerprint",
                                                                  style: AppStyles.font18.copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: fingerprintcheck
                                                                          ? Color.fromRGBO(
                                                                              108,
                                                                              202,
                                                                              81,
                                                                              1)
                                                                          : Colors
                                                                              .black)),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            8.0),
                                                                child: Text(
                                                                    "You will use it to log in to the mobile app and for payments.",
                                                                    style: AppStyles
                                                                        .font16
                                                                        .copyWith(
                                                                            color:
                                                                                Colors.grey[500])),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        CupertinoSwitch(
                                                          value:
                                                              fingerprintcheck,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              fingerprintcheck =
                                                                  value;
                                                            });
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                //use faceid
                                                 Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0),
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        top: 10.0,
                                                        bottom: 10.0),
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: Colors
                                                                    .grey[200],
                                                                width: 1))),
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
                                                              Text(
                                                                  "Use FaceID",
                                                                  style: AppStyles.font18.copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: faceidcheck
                                                                          ? Color.fromRGBO(
                                                                              108,
                                                                              202,
                                                                              81,
                                                                              1)
                                                                          : Colors
                                                                              .black)),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            8.0),
                                                                child: Text(
                                                                    "You will use it to log in to the mobile app and for payments.",
                                                                    style: AppStyles
                                                                        .font16
                                                                        .copyWith(
                                                                            color:
                                                                                Colors.grey[500])),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        CupertinoSwitch(
                                                          value:
                                                              faceidcheck,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              faceidcheck =
                                                                  value;
                                                            });
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))))))))));
        }


        // Model sheet 
  void bottomsheet(BuildContext context) {
    var title = "Enter old PIN code";
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
                      Text("$title",
                          style: AppStyles.font22
                              .copyWith(fontWeight: FontWeight.bold)),
                      
                      //Passcode
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25.0),
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
                                  color: Color.fromRGBO(0, 179, 223, 1),
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
                                  child: confirmpasscode == true ? Text("Create New Pin",
                                    style: AppStyles.buttonTextStyle):Text(
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

                                    if (confirmpasscode) {
                                      setState(() {
                                         Navigator.of(context).pushNamed('PinCodeChangeSucess');
                                       });
                                    }
                                    else
                                    {
                                      if (canContinueModel == true){
                                       setState(() {
                                         confirmpasscode = true;
                                         title = "Enter new PIN code";
                                         canContinueModel = false;
                                       });
                                    }
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
