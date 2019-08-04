import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:wealthpal/components/raised_gradient_button.dart';
import 'package:wealthpal/views/theme.dart';

class DeliveryOption extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DeliveryOptionState();
  }
}

class _DeliveryOptionState extends State<DeliveryOption> {

  final cardNumberController = TextEditingController();

  int _option = 0;

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    cardNumberController.dispose();

    super.dispose();
  }

  onBack() {
    Navigator.of(context).pushNamed('confirm_delivery_address');
  }

  onChangeOption(int value) {
    setState(() {
      _option = value;
    });
  }

  onOrderFree() {
    Navigator.of(context).pushNamed('delivery_done');
  }

  onDeliveryCard() {

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
                          margin: EdgeInsets.only(top: 28, right: 16, left: 16, bottom: 48),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onTap: onBack,
                                  child: Image.asset("assets/images/arrow_back.png", width: 24, height: 24),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Choose delivery option",
                                  textAlign: TextAlign.center,
                                  style: AppStyles.font16.copyWith(color: Colors.black),
                                ),
                              )
                            ],
                          )
                      ),
                      _buildOption(
                        value: 0,
                        opText: "Standart delivery",
                        opDesciption: "Get it by Fri, 16 Jul",
                        cost: "Free",
                      ),
                      _buildOption(
                        value: 1,
                        opText: "Express delivery",
                        opDesciption: "Get it by Fri, 06 Jul",
                        cost: "£11.99",
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(16),
                              child: RaisedGradientButton(
                                child: Text(
                                  _option == 0 ? "Order card for free" : "Delivery card for £11.99",
                                  style: AppStyles.buttonTextStyle,
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.c9100F7,
                                    AppColors.c7427F2
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                shadows: [
                                  BoxShadow(
                                    color:
                                    Color.fromARGB(64, 145, 0, 247),
                                    offset: Offset(0, 4),
                                    blurRadius: 10,
                                  )
                                ],
                                onPressed: _option == 0 ? onOrderFree : onDeliveryCard,
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

  _buildOption({int value, String opText, String opDesciption, String cost}) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Row(
        children: <Widget>[
          Radio(
            value: value,
            groupValue: _option,
            onChanged: onChangeOption,
            activeColor: AppColors.c7427F2,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        opText,
                        style: AppStyles.font14,
                      ),
                      Text(
                        opDesciption,
                        style: AppStyles.font12,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text(cost, style: AppStyles.font12.copyWith(color: AppColors.c7427F2),),
                  padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.c7427F2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
