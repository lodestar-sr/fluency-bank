import 'dart:async';

import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluencybank/views/theme.dart';

class Accounts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Accounts();

  goSignUp() {
    Navigator.of(context).pushNamed('signup_1');
  }

  goSignIn() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                child: IntrinsicHeight(
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
                          padding: EdgeInsets.only(top: 64, left: 16, right: 16),
                          child: Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Total balance', style: AppStyles.font14.copyWith(color: Colors.white)),
                                  Container(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text('£1,000.00', style: AppStyles.font36),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text('+£0.00', style: AppStyles.font14.copyWith(color: AppColors.cbfffca)),
                                      Text(' today', style: AppStyles.font14.copyWith(color: Colors.white)),
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
                                        child: Image.asset('assets/images/search-white.png', width: 24),
                                        onTap: null,
                                      ),
                                    ),
                                    RaisedGradientButton(
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset('assets/images/arrow-up-right.png', width: 24),
                                            Text(' Top Up', style: AppStyles.font14.copyWith(color: Colors.white))
                                          ],
                                        ),
                                      ),
                                      width: 120,
                                      height: 40,
                                      border: Border.all(color: Colors.white, width: 1),
                                      gradient: LinearGradient(
                                        colors: [AppColors.c00B3DF, AppColors.c00B3DF],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      onPressed: null,
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
                                extraImage: Image.asset('assets/images/text-file.png', width: 24),
                              ),
                              currencyCard(
                                currencyText: 'BTC',
                                currencySymbol: 'B',
                                amount: '0.403442',
                                additionalAmount: '+£234.43 (10%)',
                                currencyName: 'Bitcoin',
                                extraImage: Image.asset('assets/images/barcode-qr.png', width: 24),
                              ),
                              currencyCard(
                                currencyText: 'ETH',
                                currencySymbol: '£',
                                amount: '16,560.40',
                                additionalAmount: '+£234.43 (10%)',
                                currencyName: 'British Pound',
                                enabledCard: true,
                                extraImage: Image.asset('assets/images/barcode-qr.png', width: 24),
                              ),
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Free CRYPTO-FIAT\nexchange limit', style: AppStyles.font16.copyWith(fontWeight: FontWeight.bold)),
                                  RaisedGradientButton(
                                    child: Text('Increase', style: AppStyles.font14.copyWith(color: AppColors.c00B3DF)),
                                    width: 104,
                                    height: 40,
                                    border: Border.all(color: AppColors.c00B3DF, width: 1),
                                    gradient: LinearGradient(
                                      colors: [Colors.white, Colors.white],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    onPressed: null,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 24, bottom: 8),
                                child: RoundedProgressBar(
                                  height: 8,
                                  style: RoundedProgressBarStyle(
                                    borderWidth: 0,
                                    widthShadow: 0,
                                    colorProgress: AppColors.c24E343,
                                    backgroundProgress: AppColors.cF9F9F9,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  percent: 60,
                                ),
                              ),
                              Text('£5,000.00 out of £5,000.00 remaining', style: AppStyles.font12.copyWith(color: AppColors.c131113))
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset('assets/images/shuffle.png', width: 24),
                                        Text(' Exchange', style: AppStyles.font14.copyWith(color: Colors.white))
                                      ],
                                    ),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [AppColors.c00B3DF, AppColors.c00B3DF],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  onPressed: goSignUp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text('Last actions', style: AppStyles.font16.copyWith(fontWeight: FontWeight.bold)),
                                          GestureDetector(
                                            child: Text('See all', style: AppStyles.font14.copyWith(color: AppColors.c00B3DF)),
                                            onTap: null,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 8),
                                      child: Text('This month', style: AppStyles.font12.copyWith(color: AppColors.c131113)),
                                    ),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 5,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(right: 8),
                                                  child: Image.asset('assets/images/minus.png', width: 32),
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text('£0.00', style: AppStyles.font14.copyWith(color: AppColors.c212121, fontWeight: FontWeight.bold)),
                                                    Text('Spent', style: AppStyles.font14.copyWith(color: AppColors.c131113)),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(right: 8),
                                                  child: Image.asset('assets/images/plus.png', width: 32),
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text('£1,0000.00', style: AppStyles.font14.copyWith(color: AppColors.c212121, fontWeight: FontWeight.bold)),
                                                    Text('Received', style: AppStyles.font14.copyWith(color: AppColors.c131113)),
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
                                    actionRow(title: 'GBP -> BTC', time: '10:43 PM', amount1: '+B1.00', amount2: '+B1.00'),
                                    actionRow(title: 'from Jerry Simpson', time: '7:45 PM', amount1: '+£4,342.12'),
                                    actionRow(title: 'Starbucks', time: '7:45 PM', amount2: '-£3.99'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
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
  }) {
    return Container(
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
                child: Image.asset('assets/images/minus.png', width: 32),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: AppStyles.font14.copyWith(color: AppColors.c212121, fontWeight: FontWeight.bold)),
                  Text(time, style: AppStyles.font14.copyWith(color: AppColors.c131113)),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              amount1 != '' ? Text(amount1, style: AppStyles.font14.copyWith(color: AppColors.c24E343, fontWeight: FontWeight.bold)) : Container(),
              amount2 != ''
                  ? Text(amount2, style: amount1 == '' ? AppStyles.font14.copyWith(color: AppColors.c131113) : AppStyles.font12.copyWith(color: AppColors.c131113))
                  : Container(),
            ],
          )
        ],
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
    return Container(
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
                    Text(currencyText, style: AppStyles.font14.copyWith(color: AppColors.c131113, fontWeight: FontWeight.bold)),
                    enabledCard
                        ? Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.c00B3DF),
                            child: Center(
                              child: Image.asset('assets/images/credit-card.png', width: 16),
                            ),
                          )
                        : Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.cF2F2F2, width: 2),
                            ),
                            child: Center(
                              child: Image.asset('assets/images/credit-card-inactive.png', width: 16),
                            ),
                          ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 36),
                  child: Text(additionalAmount, style: AppStyles.font12.copyWith(color: AppColors.c24E343)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(currencySymbol + amount, style: AppStyles.font24.copyWith(fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(currencyName, style: AppStyles.font12.copyWith(color: AppColors.c131113)),
                ),
              ],
            ),
          ),
          Container(
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
        ],
      ),
    );
  }
}
