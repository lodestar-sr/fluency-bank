//BTC/GBP_Graph
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BTC_GBP_Graph extends StatefulWidget {
  BTC_GBP_Graph({Key key}) : super(key: key);

  @override
  _BTC_GBP_GraphState createState() => _BTC_GBP_GraphState();
}

class _BTC_GBP_GraphState extends State<BTC_GBP_Graph> {

 
  List<charts.Series> seriesList;
  bool animate;
  List<String> dayslist = ["1D","3D","1W","1M","3M","6M","1Y"];

  
  static List<charts.Series<LinearBitcoinRataes, DateTime>> _createSampleData() {
    final data = [
      new LinearBitcoinRataes(6000, DateTime(2017,9,9)),
      new LinearBitcoinRataes(6001, DateTime(2017,9,10)),
      new LinearBitcoinRataes(5002, DateTime(2017,9,20)),
      new LinearBitcoinRataes(4003, DateTime(2017,9,21)),
      new LinearBitcoinRataes(8004, DateTime(2017,9,22)),
      new LinearBitcoinRataes(4058, DateTime(2017,9,28)),
      new LinearBitcoinRataes(5025, DateTime(2017,9,31)),
      new LinearBitcoinRataes(1065, DateTime(2017,11,25)),    
    ];

    return [
      new charts.Series<LinearBitcoinRataes, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color.fromRGBO(0, 179, 223, 1)),
        domainFn: (LinearBitcoinRataes sales, _) => sales.day,
        measureFn: (LinearBitcoinRataes sales, _) => sales.rate,
        data: data,
      )
    ];
  }
  @override
  void initState() { 
    super.initState();
    _createSampleData();
  }
  
  
  
  @override
  Widget build(BuildContext context) {
   
  
    setState(() {
      seriesList = _createSampleData();
    });
  
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
                                  //test 
                                  Padding(
                                    padding: EdgeInsets.only(top :10),
                                    child: Container(
                                        height: 450,
                                        child: 
                                        new charts.TimeSeriesChart(seriesList,
                                        animate: true,
                                        animationDuration: Duration(milliseconds: 500),
                                        //defaultRenderer: new charts.LineRendererConfig(includePoints: true)
                                        behaviors: [
                                           new charts.ChartTitle('Days',
                                          behaviorPosition: charts.BehaviorPosition.bottom,
                                          titleOutsideJustification:
                                          charts.OutsideJustification.middleDrawArea),
                                          new charts.ChartTitle('Currency in £',
                                          behaviorPosition: charts.BehaviorPosition.start,
                                          titleOutsideJustification:
                                          charts.OutsideJustification.middleDrawArea)
                                        ],
                                        dateTimeFactory: const charts.LocalDateTimeFactory(),
                                        ),
                                      ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top : 35),
                                    child: Container(
                                      height: 45,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: dayslist.length,
                                        itemBuilder: (BuildContext context , int index){
                                          return GestureDetector(
                                            onTap: (){},
                                             child: Padding(
                                               padding: const EdgeInsets.only(left : 15 , right: 15),
                                               child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.black
                                                ),
                                                child: Center(
                                                  child: Text(dayslist[index],style:AppStyles.font20.copyWith(color: Colors.white)),
                                                ),
                                            ),
                                             ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
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


//Graph 

class LinearBitcoinRataes {
  final DateTime day;
  final int rate;
  LinearBitcoinRataes(this.rate,this.day);
}


