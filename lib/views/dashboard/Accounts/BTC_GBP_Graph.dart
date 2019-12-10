//BTC/GBP_Graph
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/material.dart';
class BTC_GBP_Graph extends StatefulWidget {
  BTC_GBP_Graph({Key key}) : super(key: key);

  @override
  _BTC_GBP_GraphState createState() => _BTC_GBP_GraphState();
}

class _BTC_GBP_GraphState extends State<BTC_GBP_Graph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                                  Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text("BTC/GBP",style:AppStyles.font30.copyWith(fontWeight:FontWeight.w700)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: RichText(
                                            text: TextSpan(
                                              style: AppStyles.font18.copyWith(
                                                  color: Colors.grey[500],
                                                  fontWeight: FontWeight.w500),
                                              text: "£0.00",
                                              children: [
                                                TextSpan(
                                                    text: '    +£0.00(+0%)',
                                                    style: AppStyles.font18.copyWith(
                                                  color: AppColors.c24E343,
                                                  fontWeight: FontWeight.w500)
                                                            ),
                                                TextSpan(
                                                    text: '  today',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Colors.grey[500])
                                                            ),
                                              ],
                                            ),
                                          ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              width: 200,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromRGBO(108, 202, 81, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            margin: EdgeInsets.all(8),
                                            child: RaisedGradientButton(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(Icons.arrow_downward,color:Colors.white),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:8.0),
                                                    child: Text("Buy",style:AppStyles.font18.copyWith(color:Colors.white)),
                                                  )
                                                ],
                                              ),
                                              gradient:  LinearGradient(
                                                      colors: [Color.fromRGBO(108, 202, 81, 1), Color.fromRGBO(108, 202, 81, 1)],
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                    ),

                                              onPressed: (){
                                                Navigator.of(context).pushNamed('Buy_BTC');
                                              },
                                            ),
                                        ),
                                          ),
                                        Expanded(
                                             child: Container(
                                               width: 200,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromRGBO(255, 116, 119, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            margin: EdgeInsets.all(8),
                                            child: RaisedGradientButton(
                                              child:  Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Transform.rotate(
                                                      angle:  -0.8,
                                                      child: Icon(Icons.arrow_upward,size: 25,color: Colors.white)),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:8.0),
                                                    child: Text("Sell",style:AppStyles.font18.copyWith(color:Colors.white)),
                                                  )
                                                ],
                                              ),
                                              gradient:  LinearGradient(
                                                      colors: [Color.fromRGBO(255, 116, 119, 1), Color.fromRGBO(255, 116, 119, 1)],
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                    ),

                                              onPressed: (){
                                                Navigator.of(context).pushNamed('Sell_BTC');
                                              },
                                            ),
                                          ),
                                        ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // //test 
                                  // Padding(
                                  //   padding: EdgeInsets.only(top :10),
                                  //   child: Container(
                                  //     child: Row(
                                  //       mai
                                  //     ),
                                  //   ),
                                  //)
                                  ]
                                  )
                                  )
                                  )
                                  )
                                  )
                                  );
                                  }
                                  )
                                  );
  }
}