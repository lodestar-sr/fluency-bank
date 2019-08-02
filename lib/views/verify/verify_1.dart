import 'package:flutter/material.dart';
import 'package:wealthpal/components/raised_gradient_button.dart';
import 'package:wealthpal/views/theme.dart';

class Verify1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Verify1State();
  }
}

class _Verify1State extends State<Verify1> {

  onVerify() {

  }

  onNotNow() {

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
                            padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
                            child: GestureDetector(
                              child: Text("Not now", style: AppStyles.titleGrayStyle.copyWith(fontSize: 16),),
                              onTap: onNotNow,
                            )
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                                child: Text(
                                  "Alex, prove that is \nreally you",
                                  style: AppStyles.dialogTitleStyle.copyWith(fontSize: 24),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16, left: 24, right: 24),
                                child: Text(
                                  "We just need to verify your identity to protect our community against financial crimes. You need to take max 3 photos.",
                                  style: AppStyles.inputTextStyle,
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
                                  child: Text("Verify identity", style: AppStyles.buttonTextStyle),
                                  gradient: LinearGradient(
                                    colors: [AppColors.c9100F7, AppColors.c7427F2],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color.fromARGB(64, 145, 0, 247),
                                      offset: Offset(0, 4),
                                      blurRadius: 10,
                                    )
                                  ],
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