import 'package:flutter/material.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/theme.dart';

class Topup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TopupState();
  }
}

class _TopupState extends State<Topup> {
  onTopup() {
    Navigator.of(context).pushNamed('topup_payment');
  }

  onNotNow() {
    Navigator.of(context).pushNamed('passcode');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: IntrinsicHeight(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
                      child: GestureDetector(
                        child: Text(
                          "Not now",
                          style: AppStyles.font15.copyWith(fontSize: 16, color: AppColors.c00B3DF),
                        ),
                        onTap: onNotNow,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/images/arrow-up.png", width: 40, height: 40),
                          Padding(
                            padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                            child: Text(
                              "Top up your account with £10 or more.",
                              style: AppStyles.font24.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: Text(
                              "You’re almost done setting up your new account. Now, top up with some funds that you can spend or withdraw later.",
                              style: AppStyles.font14,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(16),
                            child: RaisedGradientButton(
                              child: Text("Top up", style: AppStyles.buttonTextStyle),
                              gradient: LinearGradient(
                                colors: [AppColors.c00B3DF, AppColors.c00B3DF],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              onPressed: onTopup,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}
