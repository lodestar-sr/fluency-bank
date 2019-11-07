import 'package:flutter/material.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/theme.dart';

class SignupEnd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignupEndState();
  }
}

class _SignupEndState extends State<SignupEnd> {
  onDone() {
    Navigator.of(context).pushNamed("topup");
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
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/images/success.png", width: 40, height: 40),
                          Padding(
                            padding: EdgeInsets.only(top: 24),
                            child: Text(
                              "Congratulations!",
                              style: AppStyles.font24.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, left: 48, right: 48),
                            child: Text(
                              "Your Fluency account has been created",
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
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}
