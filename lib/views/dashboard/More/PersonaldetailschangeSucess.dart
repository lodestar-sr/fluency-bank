import 'dart:collection';

import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../theme.dart';

class PersonalDetailsChangeSuccess extends StatefulWidget {
  PersonalDetailsChangeSuccess({Key key}) : super(key: key);

  @override
  PersonalDetailsChangeSuccessState createState() => PersonalDetailsChangeSuccessState();
}

class PersonalDetailsChangeSuccessState extends State<PersonalDetailsChangeSuccess> {
  
  
  var CheckStatus = "success";
  //var CheckStatus = "failed" ;
  
  var visibilty = true;

  @override
  void initState() { 
    super.initState();
    if (CheckStatus == "success") {
      setState(() {
        visibilty = true;
      });
      
    } else {
      setState(() {
        visibilty = false;
      });
    }
    
  }
  //TODO: Money request failed // Not enought money widget remaining
  @override
  Widget build(BuildContext context) {
    

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
              child: ModalProgressHUD(
            inAsyncCall: false,
            color: AppColors.c00B3DF,
            progressIndicator: CircularProgressIndicator(),
            child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 30.0),
                              child: Container(
                                  height: 60.0,
                                  width: 60.0,
                                  child: CheckStatus == "success"
                                      ? Image.asset("assets/images/success.png")
                                      : Image.asset("assets/images/failed.png")),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 22),
                              child: CheckStatus == "success"
                                  ? Text("Success!",
                                      style: AppStyles.font24.copyWith(
                                          color: AppColors.c24E343,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none))
                                  :  Text("Some exchange problem!",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 116, 119, 1),
                                              fontFamily: 'Gilroy',
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none))
                                      ,
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: CheckStatus == "success"
                                  ? Text("The exchange will be credited in a few seconds.",
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontFamily: 'Gilroy',
                                          fontSize: 16.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w500))
                                  :  Text(
                                          "You are not confirmed payment.We recommend to check your entered data and try paymeny again.",
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontFamily: 'Gilroy',
                                              fontSize: 16.0,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w500))
                                      ,
                            ),

                            //card
                            Padding(
                              padding: EdgeInsets.only(top: 22),
                              child: Card(
                                color: Color.fromRGBO(249, 249, 249, 1),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15,
                                      left: 10.0,
                                      right: 10.0,
                                      bottom: 15.0),
                                  child: Container(
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 9.0),
                                          child: Text("You Have Changed",
                                              style: AppStyles.font24.copyWith(fontWeight: FontWeight.w600)),
                                        ),                                         
                                        ///Phone no
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 9.0, top: 25.0),
                                          child: Text("Phone number",
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 16.0,
                                                  decoration: TextDecoration.none,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 9.0, top: 5.0),
                                          child: Text("+44 9898986767",
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 16.0,
                                                  
                                                  fontWeight: FontWeight.w500,decoration: TextDecoration.lineThrough)),
                                        ),

                                        Padding(
                                        padding: EdgeInsets.only(left: 9.0,top: 0.0),
                                        child: Text("+44 9898546436",style:AppStyles.font22.
                                        copyWith(fontWeight:FontWeight.w500)),
                                        ),
                                        // Email
                                          Padding(
                                          padding: const EdgeInsets.only(
                                              left: 9.0, top: 25.0),
                                          child: Text("Email",
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 16.0,
                                                  decoration: TextDecoration.none,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 9.0, top: 5.0),
                                          child: Text("lunasmail@mail.com",
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 16.0,
                                                  
                                                  fontWeight: FontWeight.w500,decoration: TextDecoration.lineThrough)),
                                        ),
                                        Padding(
                                        padding: EdgeInsets.only(left: 9.0,top: 0.0,bottom: 15.0),
                                        child: Text("Supermail@mail.com",style:AppStyles.font22.
                                        copyWith(fontWeight:FontWeight.w500)),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Done button

                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 150.0,
                                  child: Container(
                                    margin: EdgeInsets.all(16),
                                    child: RaisedGradientButton(
                                      child: Text(
                                        "Ok",
                                        style: AppStyles.buttonTextStyle,
                                      ),
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.c00B3DF,
                                          AppColors.c00B3DF
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          var count = 0;
                                          Navigator.popUntil(context,
                                              (route) {
                                            return count++ == 3;
                                          });
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
