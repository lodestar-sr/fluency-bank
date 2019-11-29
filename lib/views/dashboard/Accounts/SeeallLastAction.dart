import 'package:flutter/material.dart';

import '../../theme.dart';

class SeeAllLastActions extends StatefulWidget {
  SeeAllLastActions({Key key}) : super(key: key);

  @override
  _SeeAllLastActionsState createState() => _SeeAllLastActionsState();
}

class _SeeAllLastActionsState extends State<SeeAllLastActions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Padding(
          padding: const EdgeInsets.only(top :8.0,bottom: 8.0,right: 8.0),
          child: Container(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: AppStyles.font16.copyWith(color: Colors.grey[600]),
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
              
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[300],
            ),
          ),
        ),
      ),

      body: SafeArea(
              child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 100.0,
                                    color: Colors.grey[100],
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            child: Text('This month',
                                                style: AppStyles.font15.copyWith(
                                                    color: AppColors.c131113)),
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 5,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        margin:
                                                            EdgeInsets.only(right: 8),
                                                        child: Image.asset(
                                                            'assets/images/minus.png',
                                                            width: 32),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text('£0.00',
                                                              style: AppStyles.font14
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .c212121,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                          Text('Spent',
                                                              style: AppStyles.font14
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .c131113)),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        margin:
                                                            EdgeInsets.only(right: 8),
                                                        child: Image.asset(
                                                            'assets/images/plus.png',
                                                            width: 32),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text('£1,0000.00',
                                                              style: AppStyles.font14
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .c212121,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                          Text('Received',
                                                              style: AppStyles.font14
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .c131113)),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),



                                  //Today 
                                  
Padding(
                        padding: EdgeInsets.only(top: 15.0, left: 15.0 , right: 15.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Expanded(
                                                                  child: Text("Today",
                                      style: AppStyles.font22
                                          .copyWith(fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                    "+£1,000.00",
                                    style: TextStyle(
                                        color: AppColors.c24E343,
                                        fontSize: 22,
                                        fontFamily: 'Gilroy'),
                                  )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0 , bottom: 8.0),
                              child: Container(
                                height: 0.5,
                                color: Colors.grey[350],
                              ),
                            ),
/////
                            Container(
                              child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 60.0,
                                        width: 60.0,
                                        child: Center(
                                          child: SizedBox(
                                            height: 30.0,
                                            width: 30.0,
                                            child: Image.asset("assets/images/arrow.png")),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Colors.grey[200],
                                            
                                            
                                      ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Text("*4664 -> GBP",
                                                  style: AppStyles.font22
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                              Text(
                                                "10:43 pm",
                                                style: TextStyle(
                                                    color: Colors.grey[500],
                                                    fontSize: 18.0),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text("+£1,000.00",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: AppColors.c24E343,
                                                    fontSize: 20.0,fontWeight: FontWeight.bold)),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Text(
                                                "Vis *4664",
                                                textAlign: TextAlign.end,
                                                style: AppStyles.font16
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                            ),
                            Container(
                              height: 50.0,
                            )
                          ],
                        ),
                      )




                                  
                                ],
                              ),
              ),
      ),
    );
  }
}
