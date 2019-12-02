import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/utils/globals.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class CardHomescreen extends StatefulWidget {
  CardHomescreen({Key key}) : super(key: key);

  @override
  _CardHomescreenState createState() => _CardHomescreenState();
}

class _CardHomescreenState extends State<CardHomescreen> {
  var friendsList = Globals.savedList;
  bool ifInvited = false;
  @override
  void initState() { 
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    if (friendsList.isEmpty) {
      setState(() {
        ifInvited = true;
      });
    } else {
      setState(() {
        ifInvited = false;
      });
    }
    setState(() {
      friendsList = Globals.savedList;
    });
    var pixelheight = MediaQuery.of(context).size.height/100;
    var pixelwidth = MediaQuery.of(context).size.width/100;
    return SafeArea(
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: SingleChildScrollView(
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),

                    //Removed Intrinsic height
                    child: Container(
                      width: double.infinity,
                      child: Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Center(
                            child: Container(
                                height: pixelheight * 55.0,
                                width: 200.0,
                                child: Image.asset(
                                    "assets/images/cardbackground.png")),
                          ),
                        ),
                        Positioned(
                          left: 0.0,
                          right: 0.0,
                          bottom: 0.0,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 13.0,
                                  color: Colors.black.withOpacity(1),
                                  offset: Offset(6.0, 7.0),
                                ),
                              ],
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.only(top : 25.0),
                              child: Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: ListView(
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Coming soon...",style:AppStyles.font18.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color:Color.fromRGBO(0, 179, 223, 1))),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20.0,bottom: 20.0),
                                          child: Text("Spend crypto instantly with your Fluency card",style: AppStyles.font24.copyWith(fontWeight: FontWeight.bold),),
                                        ),
                                        Text("In the coming weeks,we'll begin to roll out a debit card which will allow you to effortlessly spend your crypto and fait fund from your Fluency accounts in retail stores and online.\n\n Invite 3 friends before March 2020 to get your card for free.",style: AppStyles.font16.copyWith(fontWeight: FontWeight.w600),),
                                       Visibility(
                                         visible: ifInvited,
                                         child: Container(
                                          margin: EdgeInsets.all(16),
                                          child: RaisedGradientButton(
                                            child: Text(
                                              "Invite Friends",
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
                                               Navigator.of(context).pushNamed('InviteFriends');
                                                
                                              });
                                            },
                                          ),
                                        ),
                                        replacement: Padding(
                                          padding: const EdgeInsets.only( top : 10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              border: Border.all(color: AppColors.c24E343)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(top : 10.0,left: 8.0,right: 8.0,bottom: 8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("Congrats!",style:AppStyles.font24.copyWith(
                                                    fontWeight: FontWeight.bold,color: AppColors.c24E343)),
                                                  Padding(
                                                    padding: EdgeInsets.only(top:8.0),
                                                    child: Text("You've successfully invited 3 friends , and you will get your Fluency card for free.",
                                                    style:AppStyles.font18),
                                                  )
                                                
                                                
                                                ],
                                                
                                              ),
                                            ),
                                          ),
                                        ),
                                       )
                                       
                                    
                                    
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                                         top: pixelheight * 25,
                                         left: pixelwidth * 37,
                                         child: Container(
                                           height: pixelheight * 14,
                                           child: Image.asset("assets/images/man.png"),
                                         ),
                                       ),

                                       Positioned(
                                         top: pixelheight * 28.5,
                                         right: pixelwidth 
                                         *2,
                                         child: Container(
                                           height: pixelheight * 14,
                                           child: Image.asset("assets/images/woman.png"),
                                         ),
                                       )
                      ]),
                    ))));
      }),
    );
  }
}
