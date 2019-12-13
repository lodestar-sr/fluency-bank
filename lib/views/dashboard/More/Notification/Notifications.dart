import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/components/verification_code_input.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool appNotificationsCheck = false;
  bool smsCheck = false;
  bool emailNotification = false;
  


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
                                                  "Notifications",
                                                  style: AppStyles.font28
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 45.0),
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
                                                            children: <Widget>[
                                                              Text(
                                                                  "App notifications",
                                                                  style: AppStyles.font18.copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: appNotificationsCheck
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
                                                                    "You'll get notifications about sending/receiving payments.",
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
                                                              appNotificationsCheck,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              appNotificationsCheck =
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
                                                                  "SMS",
                                                                  style: AppStyles.font18.copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: smsCheck
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
                                                                    "You'll get an SMS about sending/receiving payments.",
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
                                                              smsCheck,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              smsCheck =
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

                                                // email notification
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
                                                                  "Email notifications",
                                                                  style: AppStyles.font18.copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: emailNotification
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
                                                                    "You'll get notifications about our new products.",
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
                                                              emailNotification,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              emailNotification =
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


       
}
