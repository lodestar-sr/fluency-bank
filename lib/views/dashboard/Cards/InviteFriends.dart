import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/utils/globals.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class InviteFriends extends StatefulWidget {
  InviteFriends({Key key}) : super(key: key);

  @override
  _InviteFriendsState createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {




  //Sharedpreference

  @override
  Widget build(BuildContext context) {
    var pixelheight = MediaQuery.of(context).size.height / 100;
    var pixelwidth = MediaQuery.of(context).size.width / 100;
    var friendsList = Globals.savedList;
    print("This is the global list${Globals.savedList}");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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

                      //Removed Intrinsic height
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  "Invite your friends to get your fluency card for free.",
                                  style: AppStyles.font24
                                      .copyWith(fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Text(
                                    "Invite 3 friends before 1 march 2020.",
                                    style: AppStyles.font18.copyWith(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w600)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 35),
                                child: Text("Invitations",
                                    style: AppStyles.font18.copyWith(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w600)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Container(
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
                                                  child: friendsList.isEmpty ? Icon(
                                                    Icons.person_outline,
                                                    color: Colors.grey[400],
                                                    size: 30.0,
                                                  ): friendsList[index].firstLetter.contains("PNG") ? Text("Image") : Text(friendsList[index].firstLetter),
                                                )
                                                
                                                
                                                ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.0),
                                              child: friendsList.isEmpty ?Text("Invite",
                                                  style: AppStyles.font18
                                                      .copyWith(
                                                          color:
                                                              Colors.grey[700],
                                                          fontWeight:
                                                              FontWeight.w600)) : Text(friendsList[index].displayname)
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Container(
                                  margin: EdgeInsets.all(16),
                                  child: RaisedGradientButton(
                                    child: Text(
                                      "Select from Contacts",
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
                                        Navigator.of(context)
                                            .pushNamed('InviteFriendsFromcontacts',arguments: <String,String>{
                                              'from' : 'cards'

                                            });
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))));
        }),
      ),
    );
  }
}
