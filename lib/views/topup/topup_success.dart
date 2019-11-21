import 'package:fluencybank/components/circular_image.dart';
import 'package:fluencybank/components/rounded_rect_image.dart';
import 'package:flutter/material.dart';
import 'package:fluencybank/components/masked_textinput_formatter.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class TopupSuccess extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TopupSuccessState();
  }
}

class _TopupSuccessState extends State<TopupSuccess> {

  onDone() {
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 40, right: 16, left: 16),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Image.asset("assets/images/success.png", width: 40, height: 40),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Success!", style: AppStyles.font24.copyWith(color: AppColors.c24E343, fontWeight: FontWeight.bold)),
                            Container(
                              padding: EdgeInsets.only(top: 8),
                              child: Text("You've topped up your account.", style: AppStyles.font14),
                            ),
                            Container(
                                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                                margin: EdgeInsets.only(top: 16, bottom: 16),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.cF9F9F9,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(26, 36, 32, 55),
                                      offset: Offset(0, 2),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(bottom: 8),
                                      child: Text("Your account balance", style: AppStyles.font12),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        RoundedRectImage(
                                          image: AssetImage("assets/flags/gb.png"),
                                          radius: 5,
                                          width: 32,
                                          height: 32,
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(left: 8),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text('GBP', style: AppStyles.font16),
                                                Text('£5,000.10', style: AppStyles.font12),
                                              ],
                                            ))
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 8, top: 24),
                                      child: Text("Top up method", style: AppStyles.font12),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/images/master.png",
                                          width: 32,
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(left: 8),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text('*4322', style: AppStyles.font16),
                                                Text('Bank of America', style: AppStyles.font12),
                                              ],
                                            ))
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 8, top: 24),
                                      child: Text("Top up amount", style: AppStyles.font12),
                                    ),
                                    Container(
                                      child: Text("£1,000.0", style: AppStyles.font24),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(16),
                              child: RaisedGradientButton(
                                child: Text("Done", style: AppStyles.buttonTextStyle),
                                gradient: LinearGradient(
                                  colors: [AppColors.c00B3DF, AppColors.c00B3DF],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                onPressed: onDone,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
