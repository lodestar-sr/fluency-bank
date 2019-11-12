import 'package:flutter/material.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/theme.dart';

class Verify3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Verify3State();
  }
}

class _Verify3State extends State<Verify3> {

  final String successEye = "assets/images/eye.png";
  final String failedEye = "assets/images/uneye.png";

  onVerify() {
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
                              Image.asset("assets/images/eye.png", width: 48, height: 36),
                              Padding(
                                padding: EdgeInsets.only(top: 16, left: 24, right: 24),
                                child: Text(
                                  "Thanks! We’ll review your documents in a few minutes.",
                                  style: AppStyles.font24.copyWith(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, left: 24, right: 24),
                                child: Text(
                                  "We’ll send you notification shortly.",
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
                                  child: Text("Got it", style: AppStyles.buttonTextStyle),
                                  gradient: LinearGradient(
                                    colors: [AppColors.c00B3DF, AppColors.c00B3DF],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  onPressed: onVerify,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}