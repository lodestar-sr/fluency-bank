import 'package:flutter/material.dart';
import 'package:wealthpal/components/raised_gradient_button.dart';
import 'package:wealthpal/views/theme.dart';

class Verify4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Verify4State();
  }
}

class _Verify4State extends State<Verify4> {
  final String successEye = "assets/images/eye.png";
  final String failedEye = "assets/images/uneye.png";

  onClose() {
    Navigator.of(context).pushNamed('verify_1');
  }

  onPhysicalCard() {

  }

  onVirtualCard() {
    Navigator.of(context).pushNamed('vcard_done', arguments: <String, bool>{
      'final': true,
    });
  }

  onBothCard() {
    Navigator.of(context).pushNamed('vcard_done', arguments: <String, bool>{
      'final': false,
    });
  }

  onAlreadyHaveCard() {

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
                        margin: EdgeInsets.only(top: 28, right: 16, left: 16),
                        alignment: Alignment.centerLeft,
                        height: 16,
                        child: GestureDetector(
                          onTap: onClose,
                          child: Image.asset("assets/images/close.png", width: 24, height: 24),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text("Which Wealthpal card do you want ?", style: AppStyles.font16),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 24, 16, 0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(26, 36, 32, 55),
                              offset: Offset(0, 2),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              ccard(
                                Image.asset("assets/images/credit-card.png", width: 22, height: 16),
                                "Order physical card",
                                "For online and offline spending",
                                onPhysicalCard,
                              ),
                              ccard(
                                Image.asset("assets/images/cloud.png", width: 22, height: 16),
                                "Order virtual card",
                                "Only for online payments",
                                onVirtualCard,
                              ),
                              ccard(
                                Container(
                                  alignment: Alignment.center,
                                  width: 22,
                                  child: Text("+", style: AppStyles.font16,),
                                ),
                                "Order both cards",
                                "For every payments",
                                onBothCard,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 24, 16, 24),
                        child: RawMaterialButton(
                          constraints: BoxConstraints(),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          child: Text("Already have a card?", style: AppStyles.font14.copyWith(color: AppColors.c9100F7),),
                          onPressed: onAlreadyHaveCard,
                        ),
                      )
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

  ccard(Widget icon, String title, String description, Function onPressed) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                color: AppColors.cF2F2F2,
                width: 1,
              )
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          icon,
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title, style: AppStyles.font14.copyWith(fontSize: 16)),
                      Text(description, style: AppStyles.font12.copyWith(color: Color.fromARGB(179, 34, 34, 56)),),
                    ],
                  ),
                ),
                RaisedGradientButton(
                  child: Text(">", style: AppStyles.buttonTextStyle),
                  width: 40,
                  height: 40,
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
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
