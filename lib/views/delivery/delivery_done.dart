import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:wealthpal/components/raised_gradient_button.dart';
import 'package:wealthpal/views/theme.dart';

class DeliveryDone extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DeliveryDoneState();
  }
}

class _DeliveryDoneState extends State<DeliveryDone> {

  onDashboard() {

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
                            Padding(
                              padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                              child: Text(
                                "Great! \nYour card be with \nyou in 5 days!",
                                style: AppStyles.font16.copyWith(fontSize: 24),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                              child: Text(
                                "If you'll have any trouble with delivery please contact our support.",
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
                                  "Go to Dashboard",
                                  style: AppStyles.buttonTextStyle,
                                ),
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
                                onPressed: onDashboard,
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
