import 'dart:async';

import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/dashboard/accounts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluencybank/views/theme.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentTab = 0;
  final List<Widget> screens = [];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Accounts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: new RawMaterialButton(
          shape: new CircleBorder(),
          elevation: 0.0,
          child: Image.asset('assets/images/icon.png', width: 40),
          onPressed: null,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0,
        child: Container(
            height: 84,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Left Tab icons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 72,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 8, top: 12),
                            child: Image.asset(
                              currentTab == 0 ? 'assets/images/accounts-active.png' : 'assets/images/accounts.png',
                              height: 15,
                            ),
                          ),
                          Text('Accounts', style: AppStyles.font12.copyWith(color: currentTab == 0 ? AppColors.c00B3DF : AppColors.c131113)),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          currentTab = 0;
                        });
                      },
                    ),
                    MaterialButton(
                      minWidth: 72,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 8, top: 12),
                            child: Image.asset(
                              currentTab == 1 ? 'assets/images/card-active.png' : 'assets/images/card.png',
                              height: 15,
                            ),
                          ),
                          Text('Card', style: AppStyles.font12.copyWith(color: currentTab == 1 ? AppColors.c00B3DF : AppColors.c131113)),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          currentTab = 1;
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  child: Text('Payments', style: AppStyles.font12.copyWith(color: AppColors.c131113,)),
                ),
                // Right Tab icons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 72,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 8, top: 12),
                            child: Image.asset(
                              currentTab == 2 ? 'assets/images/invite-active.png' : 'assets/images/invite.png',
                              height: 15,
                            ),
                          ),
                          Text('Invite', style: AppStyles.font12.copyWith(color: currentTab == 2 ? AppColors.c00B3DF : AppColors.c131113)),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          currentTab = 2;
                        });
                      },
                    ),
                    MaterialButton(
                      minWidth: 72,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 8, top: 12),
                            child: Image.asset(
                              currentTab == 3 ? 'assets/images/more-active.png' : 'assets/images/more.png',
                              height: 15,
                            ),
                          ),
                          Text('More', style: AppStyles.font12.copyWith(color: currentTab == 3 ? AppColors.c00B3DF : AppColors.c131113)),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          currentTab = 3;
                        });
                      },
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
