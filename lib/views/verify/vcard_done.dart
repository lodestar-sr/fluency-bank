import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/theme.dart';

class VCardDone extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VCardDoneState();
  }
}

class _VCardDoneState extends State<VCardDone> {

  onDashboard() {

  }

  onContinue() {
    Navigator.of(context).pushNamed("confirm_delivery_address");
  }

  @override
  Widget build(BuildContext context) {

    final LinkedHashMap<String, bool> args = ModalRoute.of(context).settings.arguments;
    final finalScreen = args["final"];

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 24, left: 24, right: 24),
                              child: Text(
                                "Virtual card \nis successfully added \nto your account!",
                                style: AppStyles.font16.copyWith(fontSize: 24),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 24, left: 24, right: 24),
                              child: Text(
                                finalScreen ? "Now you can use." : "Now add pick up the delivery address for a physical card.",
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
                                child: Text(
                                  finalScreen ? "Go to Dashboard" : "Continue",
                                  style: AppStyles.buttonTextStyle,
                                ),
                                gradient: LinearGradient(
                                  colors: [AppColors.c00B3DF, AppColors.c00B3DF],
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
                                onPressed: finalScreen ? onDashboard : onContinue,
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
