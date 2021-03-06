import 'dart:async';

import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

class Accounts extends StatefulWidget {
  Accounts({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> with TickerProviderStateMixin {

  
  
  var flag = [false, false];
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    //
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  goSignUp() {
    Navigator.of(context).pushNamed('signup_1');
  }
  gotoAddaccount()
  {
    Navigator.of(context).pushNamed('add_acount');
  }
  goSignIn() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _scale = 1 - _controller.value;
    return ModalProgressHUD(
      inAsyncCall: false,
      color: AppColors.c00B3DF,
      progressIndicator: CircularProgressIndicator(),
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
                child: Stack(children: [
                  Image.asset(
                    "assets/images/dashboard-bg.png",
                    width: size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.only(top: 64, left: 16, right: 16),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Total balance',
                                    style: AppStyles.font14
                                        .copyWith(color: Colors.white)),
                                Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Text('£1,000.00',
                                      style: AppStyles.font36),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text('+£0.00',
                                        style: AppStyles.font14.copyWith(
                                            color: AppColors.cbfffca)),
                                    Text(' today',
                                        style: AppStyles.font14
                                            .copyWith(color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 18),
                                    child: GestureDetector(                                     
                                      child: Image.asset(
                                          'assets/images/search-white.png',
                                          width: 24),
                                      onTap: (){
                                        Navigator.of(context).pushNamed('SearchScreen');
                                      },
                                    ),
                                  ),
                                  RaisedGradientButton(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                              'assets/images/arrow-up-right.png',
                                              width: 24),
                                          Text(' Top Up',
                                              style: AppStyles.font14
                                                  .copyWith(
                                                      color: Colors.white))
                                        ],
                                      ),
                                    ),
                                    width: 120,
                                    height: 40,
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.c00B3DF,
                                        AppColors.c00B3DF
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    onPressed: (){
                                      setState(() {
                                        Navigator.of(context).pushNamed('topupaccount',arguments: <String,String>{
                      "currencyText" : "GBP",
                      "amount" : "£1,000.00",
                      "from" : 'accountHome',
                    });
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 22),
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            
                            currencyCard(
                              currencyText: 'GBP',
                              currencySymbol: '£',
                              amount: '16,560.40',
                              additionalAmount: '',
                              currencyName: 'British Pound',
                              enabledCard: true,
                              extraImage: Image.asset(
                                  'assets/images/text-file.png',
                                  width: 24),
                            ),
                            currencyCard(
                              currencyText: 'BTC',
                              currencySymbol: 'B',
                              amount: '0.403442',
                              additionalAmount: '+£234.43 (10%)',
                              currencyName: 'Bitcoin',
                              extraImage: Image.asset(
                                  'assets/images/barcode-qr.png',
                                  width: 24),
                            ),
                            // currencyCard(
                            //   currencyText: 'ETH',
                            //   currencySymbol: '£',
                            //   amount: '16,560.40',
                            //   additionalAmount: '+£234.43 (10%)',
                            //   currencyName: 'British Pound',
                            //   enabledCard: true,
                            //   extraImage: Image.asset(
                            //       'assets/images/barcode-qr.png',
                            //       width: 24),
                            // ),
                            addcurrencycard(),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(48, 36, 32, 55),
                              offset: Offset(0, 2),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Free CRYPTO-FIAT\nexchange limit',
                                    style: AppStyles.font16.copyWith(
                                        fontWeight: FontWeight.bold)),
                                RaisedGradientButton(
                                  child: Text('Buy Crypto',
                                      style: AppStyles.font14.copyWith(
                                          color: AppColors.c00B3DF,fontWeight: FontWeight.w600)),
                                  width: 104,
                                  height: 40,
                                  border: Border.all(
                                      color: AppColors.c00B3DF, width: 1),
                                  gradient: LinearGradient(
                                    colors: [Colors.white, Colors.white],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  onPressed: (){
                                    Navigator.of(context).pushNamed('Buy_Crypto');
                                  },
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 24, bottom: 8),
                              child: LinearPercentIndicator(
                                lineHeight: 8,
                                percent: 0.6,
                                backgroundColor: AppColors.cF9F9F9,
                                progressColor: AppColors.c24E343,
                              ),
                            ),
                            Text('£5,000.00 out of £5,000.00 remaining',
                                style: AppStyles.font12
                                    .copyWith(color: AppColors.c131113))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: RaisedGradientButton(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset('assets/images/shuffle.png',
                                          width: 24),
                                      Text(' Exchange',
                                          style: AppStyles.font14
                                              .copyWith(color: Colors.white))
                                    ],
                                  ),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.c00B3DF,
                                    AppColors.c00B3DF
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                onPressed: (){
                                  Navigator.of(context).pushNamed('exchange');
                                  //// Changed goSignUp
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top :8.0 , bottom: 8.0   ),
                        child: Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(48, 36, 32, 55),
                                offset: Offset(0, 2),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(16, 24, 16, 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(bottom: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text('Last actions',
                                              style: AppStyles.font16.copyWith(
                                                  fontWeight: FontWeight.bold)),
                                          GestureDetector(
                                            child: Text('See all',
                                                style: AppStyles.font14
                                                    .copyWith(
                                                        color:
                                                            AppColors.c00B3DF)),
                                            onTap: (){
                                              Navigator.of(context).pushNamed('seealllastactions',
                                    );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 8),
                                      child: Text('This month',
                                          style: AppStyles.font12.copyWith(
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
                              Divider(
                                height: 1,
                                color: AppColors.cF9F9F9,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 16, bottom: 16),
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
                                        type: 'person'),
                                    actionRow(
                                        title: 'Starbucks',
                                        time: '7:45 PM',
                                        image : 'star',
                                        amount1: '-£3.99',
                                        type: 'company'),
                                        actionRow(
                                          title: 'Adobe',
                                          time: '2:12 PM',
                                          image: 'adobe',
                                          amount1: '-\$199,99',
                                          amount2: '-\$19,99',
                                          type: 'company'
                                        ),
                                        actionRow(
                                          title: 'Wallmart',
                                          time: '10:32 am',
                                          image: 'walmart',
                                          amount1: '-£78.19',
                                          type: 'company'
                                        ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }

  actionRow({
    String title = '',
    String time = '',
    String amount1 = '',
    String amount2 = '',
    String image = '',
    String type = "",
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
                  child: Center(child: Image.asset('assets/images/$image.png', width: 32)),
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

  Widget addcurrencycard() {
    return Padding(
      padding: const EdgeInsets.only(top :46.0 , bottom: 66.0),
      
      child: Center(
        child: GestureDetector(
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTap: (){
            gotoAddaccount();
          },
          child: Transform.scale(
            scale: _scale,
            child: Container(
              margin: EdgeInsets.only(right: 8, left: 8),
              height: 200.0,
              //width: 80.0,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(48, 36, 32, 55),
                  offset: Offset(0, 2),
                  blurRadius: 20,
                ),
                
              ],border: Border.all(color: AppColors.c00B3DF), 
              color: Color.fromRGBO(255, 255, 255, 0.7),
               borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding: const EdgeInsets.only(left : 10.0,right: 10,top: 20,bottom: 20),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: AppColors.c00B3DF,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left :8.0),
                      child: Text("Add \naccount",style:AppStyles.font18.copyWith(color:AppColors.c00B3DF)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  currencyCard({
    String currencyText = '',
    String currencySymbol = '',
    String amount = '',
    String currencyName = '',
    String additionalAmount = '',
    Image extraImage,
    bool enabledCard = false,
  }) {
    return GestureDetector(
      onTap: () {
        //BTC_AccountDetails
      
        currencyText == "BTC" ? Navigator.of(context).pushNamed('BTC_AccountDetails',
                                    arguments: <String, String>{
                                      "currencyText": currencyText,
                                      "amount" : amount,
                                    }) :
                                    Navigator.of(context).pushNamed('account_details',
                                    arguments: <String, String>{
                                      "currencyText": currencyText,
                                      "amount" : amount,
                                    });
      },
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: 180,
              height: 168,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(48, 36, 32, 55),
                    offset: Offset(0, 2),
                    blurRadius: 20,
                  ),
                ],
              ),
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(right: 8, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(currencyText,
                          style: AppStyles.font14.copyWith(
                              color: AppColors.c131113,
                              fontWeight: FontWeight.bold)),
                      enabledCard
                          ? Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.c00B3DF),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/credit-card.png',
                                    width: 16),
                              ),
                            )
                          : Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: AppColors.cF2F2F2, width: 2),
                              ),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/credit-card-inactive.png',
                                    width: 16),
                              ),
                            ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 36),
                    child: Text(additionalAmount,
                        style: AppStyles.font12
                            .copyWith(color: AppColors.c24E343)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(currencySymbol + amount,
                        style: AppStyles.font24
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(currencyName,
                        style: AppStyles.font12
                            .copyWith(color: AppColors.c131113)),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  currencyText == "BTC" ? accountDetailsBottomSheet(context , currencyText):
                  ModalBottomSheet(context , currencyText);
                });
              },
                          child: Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(top: 140, left: 120),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(48, 36, 32, 55),
                      offset: Offset(0, 2),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Center(
                  child: extraImage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


   //Bottom sheet
  void ModalBottomSheet(context, String accounttype) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
                
            return Scaffold(
                          body: Builder(
        builder: (context) => Container(             
                child: new ListView(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SingleChildScrollView(
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
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                          child: Text("Your $accounttype account details",
                              style: AppStyles.font24
                                  .copyWith(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 12.0),
                          child: Text("Account number",
                              style: AppStyles.font16.copyWith()),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 12.0),
                          child: Text("25443658",
                              style: AppStyles.font24.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 18.0)),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 12.0),
                          child: Text("Sort code",
                              style: AppStyles.font16.copyWith()),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 12.0),
                          child: Text("08-90-90",
                              style: AppStyles.font24.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 18.0)),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 12.0),
                          child: Text("IBAN", style: AppStyles.font16.copyWith()),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 12.0),
                          child: Text("GB29 NWBK 6016 1331 9268 19",
                              style: AppStyles.font24.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 18.0)),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 12.0),
                          child: Text("SWIFT/BIC",
                              style: AppStyles.font16.copyWith()),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 12.0),
                          child: Text("SREDF344G",
                              style: AppStyles.font24.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 18.0)),
                        ),
                      ],
                    ),
                    //button

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  print("OBject1 tapped");
                                  flag[0] = true;
                                  flag[1] = false;
                                  print(flag);
                                  Share.share(
                                      'Account number:- 25443658\n Sort code :- 08-90-90 \n IBAN:- GB29 NWBK 6016 1331 9268 19 \n SWIFT/BIC :- SREDF344G',
                                      subject: '$accounttype Details');
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Container(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        CupertinoIcons.share_up,
                                        size: 25.0,
                                        color: flag[0] == true
                                            ? Colors.white
                                            : AppColors.c00B3DF,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text("Share",
                                            style: AppStyles.font16.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: flag[0] == true
                                                  ? Colors.white
                                                  : AppColors.c00B3DF,
                                            )),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: flag[0] == true
                                        ? AppColors.c00B3DF
                                        : Colors.white,
                                    border: Border.all(
                                        color: AppColors.c00B3DF, width: 2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  flag[1] = true;
                                  flag[0] = false;
                                  print(flag);

                                  Clipboard.setData(
                                                              new ClipboardData(
                                                                  text:
                                                                      'Account number:- 25443658\n Sort code :- 08-90-90 \n IBAN:- GB29 NWBK 6016 1331 9268 19 \n SWIFT/BIC :- SREDF344G'));
                                                          //Copied to Clipboard

                                                          Scaffold.of(context)
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            content: Text(
                                                                "Copied to Clipboard."),
                                                          ));
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: Container(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.content_copy,
                                        size: 25.0,
                                        color: flag[1] == true
                                            ? Colors.white
                                            : AppColors.c00B3DF,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text("copy",
                                            style: AppStyles.font16.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: flag[1] == true
                                                  ? Colors.white
                                                  : AppColors.c00B3DF,
                                            )),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: flag[1] == true
                                        ? AppColors.c00B3DF
                                        : Colors.white,
                                    border: Border.all(
                                        color: AppColors.c00B3DF, width: 2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
          });
        });
  }

  //Bottom sheet
  void accountDetailsBottomSheet(context, String accounttype) {
    var code = "3EHLU8hgBKwucH4N2LYHH46CtZk9RsqScm";
    List<bool> flag = [false,false];
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Scaffold(
                          body: Builder(
        builder: (context) =>SingleChildScrollView(
                          child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0,),
                            child: Text("Your $accounttype account details",
                                style: AppStyles.font24
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Scan or share your address",style:AppStyles.font18.copyWith(color:Colors.grey[500])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Container(
                            child: QrImage(
                           data: "$code",
                           version: QrVersions.auto,
                           size: 200.0,
                           ),
                          ),
                        ),
                      ),

                      Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Wallet address",style:AppStyles.font18.copyWith(color:Colors.grey[500])),
                      ),
                      Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 20),
                      child: Text("$code",style:AppStyles.font16.copyWith(fontSize: 17,fontWeight: FontWeight.w600)),
                      ),
                      //button

                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    print("OBject1 tapped");
                                    flag[0] = true;
                                    flag[1] = false;
                                    print(flag);
                                    Share.share(
                                        'Wallet Address :- $code',
                                        subject: 'Look what I made!');
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          CupertinoIcons.share_up,
                                          size: 25.0,
                                          color: flag[0] == true
                                              ? Colors.white
                                              : AppColors.c00B3DF,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text("Share",
                                              style: AppStyles.font16.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: flag[0] == true
                                                    ? Colors.white
                                                    : AppColors.c00B3DF,
                                              )),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: flag[0] == true
                                          ? AppColors.c00B3DF
                                          : Colors.white,
                                      border: Border.all(
                                          color: AppColors.c00B3DF, width: 2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    flag[1] = true;
                                    flag[0] = false;
                                    print(flag);
                                    setState(() {
                                                        Clipboard.setData(
                                                            new ClipboardData(
                                                                text:
                                                                    code));
                                                        //Copied to Clipboard

                                                        Scaffold.of(context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                          content: Text(
                                                              "Copied to Clipboard."),
                                                        ));
                                                      });
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.content_copy,
                                          size: 25.0,
                                          color: flag[1] == true
                                              ? Colors.white
                                              : AppColors.c00B3DF,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text("copy",
                                              style: AppStyles.font16.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: flag[1] == true
                                                    ? Colors.white
                                                    : AppColors.c00B3DF,
                                              )),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: flag[1] == true
                                          ? AppColors.c00B3DF
                                          : Colors.white,
                                      border: Border.all(
                                          color: AppColors.c00B3DF, width: 2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
          });
        });
  }

}
