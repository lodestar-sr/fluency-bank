import 'package:flutter/material.dart';
import 'package:wealthpal/components/raised_gradient_button.dart';
import 'package:wealthpal/views/theme.dart';

class Topup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TopupState();
  }
}

class _TopupState extends State<Topup> {

  onTopup() {
    Navigator.of(context).pushNamed('verify_1');
  }

  onNotNow() {
    Navigator.of(context).pushNamed('verify_2');
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
                            child: Text("Not now", style: AppStyles.font15.copyWith(fontSize: 16),),
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
                                  "Top up your account \nwith £10 or more",
                                  style: AppStyles.font16.copyWith(fontSize: 24),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16, left: 24, right: 24),
                                child: Text(
                                  "Before we hook you up with an acoount, you need to top up. You can spend or withdrow this money later.",
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
                                  onPressed: onTopup,
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