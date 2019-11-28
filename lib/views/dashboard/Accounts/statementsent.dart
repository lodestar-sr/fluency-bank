import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/material.dart';

class Statementsent extends StatelessWidget {
  const Statementsent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
              child: SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Container(
                          color: Colors.white,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 50.0, left: 15.0, right: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  width: 60,
                                  child:
                                      Image.asset("assets/images/invoice.png"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: Text("Statement is sent",
                                      style: AppStyles.font24.copyWith(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: EdgeInsets.all(16),
                                      child: RaisedGradientButton(
                                        child: Text(
                                          "Done",
                                          style: AppStyles.buttonTextStyle,
                                        ),
                                        gradient: LinearGradient(
                                          colors: [
                                            AppColors.c00B3DF,
                                            AppColors.c00B3DF
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        onPressed: () {
                                          var count = 0;
                                          Navigator.popUntil(context, (route) {
                                        return count++ == 3;
                                      });
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ))));
        }),
      ),
    );
  }
}
