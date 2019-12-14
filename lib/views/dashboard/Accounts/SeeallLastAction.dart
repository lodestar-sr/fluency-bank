import 'package:email_validator/email_validator.dart';
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 100.0,
                                    color: Colors.grey[100],
                                    child: Padding(
                                      padding: const EdgeInsets.only(top : 10.0,left: 15,right: 15),
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
                        padding: EdgeInsets.only(top: 15.0,left: 15,right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Expanded(
                                   child: Text("Today",
                                      style: AppStyles.font20
                                          .copyWith(fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                    "+£1,000.00",
                                    style: TextStyle(
                                        color: AppColors.c24E343,
                                        fontSize: 20,
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
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      actionRow(
                                        title: 'GBP -> BTC',
                                        time: '10:43 PM',
                                        amount1: '+B1.00',
                                        image : 'exchange',
                                        amount2: '+B1.00'),
                                    actionRow(
                                        title: 'from Jerry Simpson',
                                        time: '7:45 PM',
                                        image : 'jerry',
                                        amount1: '+£4,342.12',
                                        amount2: '-£92.74',
                                         type: 'person',),
                                    actionRow(
                                        title: 'Starbucks',
                                        time: '7:45 PM',
                                        image : 'star',
                                        amount1: '-£3.99',
                                         type: 'company',),
                                        actionRow(
                                          title: 'Adobe',
                                          time: '2:12 PM',
                                          image: 'adobe',
                                          amount1: '-\$174.76',
                                          amount2: '-\$19,99',
                                           type: 'company',
                                        ),
                                        actionRow(
                                          title: 'Wallmart',
                                          time: '10:32 am',
                                          image: 'walmart',
                                          amount1: '-£174.76',
                                          amount2: '-£78.19',
                                           type: 'company',
                                        ),
                                    ],
                                  ),
                            ),
                          ],
                        ),
                      ),

                      //6 august
                            Padding(
                              padding: const EdgeInsets.only(top : 10.0,left: 15,right: 15),
                              child: Text("6 August",
                                        style: AppStyles.font20
                                            .copyWith(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0 , bottom: 8.0,left: 15,right: 15),
                              child: Container(
                                height: 0.5,
                                color: Colors.grey[350],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0 , bottom: 8.0,left: 15,right: 15),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        actionRow(
                                          title: 'GBP -> ETH',
                                          time: '10:43 PM',
                                          amount1: '+1.00',
                                          image : 'exchange',
                                          amount2: '-£174.76'),
                                      actionRow(
                                          title: 'to Ava-May Connolly',
                                          time: '2:55 PM',
                                          image : 'avamay',
                                          amount1: '-£9,224.66',
                                          amount2: '-£92.74',
                                          type: 'person',
                                          ),
                                          
                                      actionRow(
                                          title: 'Starbucks',
                                          time: '7:45 PM',
                                          image : 'star',
                                          amount1: '-£174.76',
                                          amount2: '-£3.99',
                                          type: 'company',),
                                          actionRow(
                                            title: 'Adobe',
                                            time: '2:12 PM',
                                            image: 'adobe',
                                            amount1: '-\$174.76',
                                            amount2: '-\$19,99',
                                            type: 'company',
                                          ),
                                          
                                      ],
                                    ),
                              ),
                            ),
                            






                      ],
                ),
              ),
      ),
    );
  }

  actionRow({
    String title = '',
    String time = '',
    String amount1 = '',
    String amount2 = '',
    String image = '',
    String type = '',
  }) {
    return GestureDetector(
      onTap: (){
        if (type == "person") {
          Navigator.of(context).pushNamed('Payment_Receipt_person',arguments: <String,String>{
            'amount1':amount1,
            'amount2':amount2,
            'time':time,
            'paymenttype':'Regular'
          });
        } else if (type == "company")    
        {
          //Payment_Receipt_Company
          Navigator.of(context).pushNamed('Payment_Receipt_Company',arguments: <String,String>{
            'amount1':amount1,
            'amount2':amount2,
            'time':time,
            'name':title,
            'image':image,
            'paymenttype':'Regular',
          });
        }
      },
          child: Container(
        margin: EdgeInsets.only(top: 8, bottom: 8),
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: Center(child: Image.asset('assets/images/$image.png', width: 40)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title,
                        style: AppStyles.font14.copyWith(
                            color: AppColors.c212121,
                            fontWeight: FontWeight.bold)),
                    Text(time,
                        style:
                            AppStyles.font14.copyWith(color: AppColors.c131113)),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                amount1 != ''
                    ? Text(amount1,
                        style: AppStyles.font14.copyWith(
                            color: AppColors.c24E343,
                            fontWeight: FontWeight.bold))
                    : Container(),
                amount2 != ''
                    ? Text(amount2,
                        style: amount1 == ''
                            ? AppStyles.font14.copyWith(color: AppColors.c131113)
                            : AppStyles.font12.copyWith(color: AppColors.c131113))
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
