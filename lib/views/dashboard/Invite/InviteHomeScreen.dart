import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/utils/globals.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:share/share.dart';

class InviteHomescreen extends StatefulWidget {
  InviteHomescreen({Key key}) : super(key: key);

  @override
  _InviteHomescreenState createState() => _InviteHomescreenState();
}

class _InviteHomescreenState extends State<InviteHomescreen> {
  var friendsList = Globals.savedListfromInviteScreen;
  bool getExchangeBtnClicked = true;
  bool ifInvited = false;
  var shareLink = "http://fluency.io/fdHFRee98";
  
  @override
  void initState() {
    super.initState();
    
    
    
  }
  Future<void> mainsjjjj() async { friendsList =  await Globals.savedListfromInviteScreen; }
  
  @override
  Widget build(BuildContext context) {
    setState(() {
      print("object");   
      friendsList = Globals.savedListfromInviteScreen;
    });
    if (friendsList.isEmpty) {
      setState(() {
        ifInvited = true;
      });
    } else {
      setState(() {
        ifInvited = false;
      });
    }
    return Container(
      color: Color.fromRGBO(0, 179, 223, 1),
      child: SafeArea(child: LayoutBuilder(
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
                color: Color.fromRGBO(0, 179, 223, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 40.0),
                      child: Text("Invite",
                          style: AppStyles.font36.copyWith(
                              fontSize: 45,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child:
                              //For Changing the whole screen

                              Visibility(
                            visible: getExchangeBtnClicked,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Your bonus",
                                    style: AppStyles.font28
                                        .copyWith(fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                      "Your remaining free crypto-fiat exchange credit",
                                      style: AppStyles.font18.copyWith(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w500)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 25.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 13.0,
                                          color: Colors.grey[300],
                                          //offset: Offset(6.0, 7.0),
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 8, bottom: 8),
                                            child: LinearPercentIndicator(
                                              lineHeight: 8,
                                              percent: 0.9,
                                              backgroundColor:
                                                  AppColors.cF9F9F9,
                                              progressColor: AppColors.c24E343,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Text(
                                                '£4,567.47 out of £5,000.00 remaining',
                                                style: AppStyles.font14
                                                    .copyWith(
                                                        color:
                                                            AppColors.c828282)),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 10.0),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[100],
                                                borderRadius:
                                                    BorderRadius.circular(8.0)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20.0, bottom: 20.0),
                                              child: Visibility(
                                                visible: ifInvited,
                                                child: Text(
                                                  "Get 3 friends to sign up , verify their identity and top up money via bank transfer or card to get an additional £1,000 in free crypto-fiat exchanges.",
                                                  textAlign: TextAlign.center,
                                                  style: AppStyles.font18
                                                      .copyWith(
                                                          color:
                                                              Colors.grey[600],
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                                replacement: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "  You have invited 3 people.\n Claim your additional credit!",
                                                      style: AppStyles.font18
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .grey[500]),
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.all(16),
                                                      child:
                                                          RaisedGradientButton(
                                                        child: Text(
                                                          "Get £1,000 in free exchanges",
                                                          style: AppStyles
                                                              .buttonTextStyle,
                                                        ),
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            AppColors.c00B3DF,
                                                            AppColors.c00B3DF
                                                          ],
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            getExchangeBtnClicked =
                                                                false;
                                                          });
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 35),
                                            child: Text("Invitations",
                                                style: AppStyles.font18
                                                    .copyWith(
                                                        color: Colors.grey[500],
                                                        fontWeight:
                                                            FontWeight.w600)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 15.0),
                                            child: Container(
                                              height: 210,
                                              child: ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: 3,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                            height: 50.0,
                                                            width: 50.0,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .grey[200],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0)),
                                                            child: Center(
                                                              child: friendsList
                                                                      .isEmpty
                                                                  ? Icon(
                                                                      Icons
                                                                          .person_outline,
                                                                      color: Colors
                                                                              .grey[
                                                                          400],
                                                                      size:
                                                                          30.0,
                                                                    )
                                                                  : friendsList[
                                                                              index]
                                                                          .firstLetter
                                                                          .contains(
                                                                              "PNG")
                                                                      ? Text(
                                                                          "Image")
                                                                      : Text(friendsList[
                                                                              index]
                                                                          .firstLetter),
                                                            )),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 15.0),
                                                            child: friendsList
                                                                    .isEmpty
                                                                ? Text(
                                                                    "${index} Friend",
                                                                    style: AppStyles.font18.copyWith(
                                                                        color: Colors.grey[
                                                                            700],
                                                                        fontWeight: FontWeight
                                                                            .w600))
                                                                : Text(friendsList[index].displayname,
                                                                    style: AppStyles
                                                                        .font18
                                                                        .copyWith(
                                                                            color: Colors.grey[700],
                                                                            fontWeight: FontWeight.w600)))
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Visibility( 
                                            visible: ifInvited,
                                                                                      child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15.0),
                                              child: Container(
                                                margin: EdgeInsets.all(16),
                                                child: RaisedGradientButton(
                                                  child: Text(
                                                    "Select from Contacts",
                                                    style:
                                                        AppStyles.buttonTextStyle,
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
                                                      Navigator.of(context).pushNamed(
                                                          'InviteFriendsFromcontacts',
                                                          arguments: <String, String>{
                                                            'from': 'invite'
                                                          });
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),

                            //Replacement
                            replacement: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Your bonus",
                                    style: AppStyles.font28
                                        .copyWith(fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                      "Your remaining free crypto-fiat exchange credit",
                                      style: AppStyles.font18.copyWith(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w500)),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 25.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 13.0,
                                            color: Colors.grey[300],
                                            //offset: Offset(6.0, 7.0),
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 8, bottom: 8),
                                              child: LinearPercentIndicator(
                                                lineHeight: 8,
                                                percent: 1,
                                                backgroundColor:
                                                    AppColors.cF9F9F9,
                                                progressColor:
                                                    AppColors.c24E343,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0),
                                              child: Text(
                                                  '£5,000.00 out of £5,000.00 remaining',
                                                  style: AppStyles.font14
                                                      .copyWith(
                                                          color: AppColors
                                                              .c828282)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    ),

                                    //Sharable link 
                                    Padding(
                                      padding: const EdgeInsets.only(top : 25.0),
                                      child: Container(
                                        //color: Colors.grey[100],
                                        child: Column(
                                          
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Share this invite link to clain additional credit",
                                            style: AppStyles.font14,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.grey[400]),
                                                  borderRadius:
                                                      BorderRadius.circular(5.0)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Text(shareLink,style: AppStyles.font18.copyWith(color: Colors.grey[600]),),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                            child: Container(
                                              height: 50.0,
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                    
                                                      
                                                      child: RaisedGradientButton(
                                                        
                                                        child: Text(
                                                          "Share",
                                                          style: AppStyles
                                                              .buttonTextStyle,
                                                        ),
                                                        gradient: LinearGradient(
                                                          colors: [
                                                            AppColors.c00B3DF,
                                                            AppColors.c00B3DF
                                                          ],
                                                          begin:
                                                              Alignment.topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            Share.share(shareLink,
                                                                subject:
                                                                    'Invite Link to Fluency Bank');
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left :8.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      
                                                      child: RaisedGradientButton(
                                                        child: Icon(
                                                            Icons.content_copy),
                                                        border: Border.all(
                                                            color:
                                                                AppColors.c00B3DF),
                                                        onPressed: () {
                                                          setState(() {
                                                            Clipboard.setData(
                                                                new ClipboardData(
                                                                    text:
                                                                        shareLink));
                                                            //Copied to Clipboard

                                                            Scaffold.of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                              content: Text(
                                                                  "Copied to Clipboard."),
                                                            ));
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      ),
                                    ),
                               //Invited friends 
                                    Padding(
                                      padding: EdgeInsets.only(top:  45.0),
                                      child: Text("Friends you invited",
                                          style: AppStyles.font18.copyWith(
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.w500)),
                                    ),

                                    //List of friends invited
                                    Container(
                                      height: 210,
                                      child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                    itemCount: 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                height: 50.0,
                                                width: 50.0,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                child: Center(
                                                  child: friendsList[index].firstLetter.contains("PNG") ? Text("Image") : Text(friendsList[index].firstLetter),
                                                )
                                                
                                                
                                                ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.0),
                                              child: Text(friendsList[index].displayname)
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
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
            )));
      })),
    );
  }
}
