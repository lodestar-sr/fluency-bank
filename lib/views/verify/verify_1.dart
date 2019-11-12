import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/utils/globals.dart';
import 'package:fluencybank/views/theme.dart';

class Verify1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Verify1State();
  }
}

class _Verify1State extends State<Verify1> {

  static const platform = const MethodChannel('flutter.native/helper');

  Future<void> startOnfidoKYC() async {

    String response = "";
    try {
      final String result = await platform.invokeMethod('startKYC', <String, String>{
        'first_name': Globals.firstName,
        'last_name': Globals.lastName,
        'email': Globals.email,
      });

      response = result;
      if (response == "Success") {
        Navigator.of(context).pushNamed('verify_3');
      }
    } on PlatformException catch(e) {
      response = "Failed to invoke: '${e.message}'.";
    }
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
                              Image.asset("assets/images/thumb-up.png", width: 40, height: 40),
                              Padding(
                                padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                                child: Text(
                                  Globals.firstName + ", prove it is really you",
                                  style: AppStyles.font24.copyWith(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16, left: 24, right: 24),
                                child: Text(
                                  "We just need to verify your identity to protect our community against financial crimes. You need to take max 3 photos.",
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
                                  child: Text("Verify identity", style: AppStyles.buttonTextStyle),
                                  gradient: LinearGradient(
                                    colors: [AppColors.c00B3DF, AppColors.c00B3DF],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  onPressed: startOnfidoKYC,
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