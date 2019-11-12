import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fluencybank/components/masked_textinput_formatter.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/theme.dart';

class ConfirmDeliveryAddress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConfirmDeliveryAddressState();
  }
}

class _ConfirmDeliveryAddressState extends State<ConfirmDeliveryAddress> {

  final cardNumberController = TextEditingController();

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
    Navigator.of(context).pushNamed('verify_4');
  }

  onChangeAddress() {
    Navigator.of(context).pushNamed('delivery_address');
  }

  onConfirm() {
    Navigator.of(context).pushNamed('delivery_option');
  }

  @override
  Widget build(BuildContext context) {
    final LinkedHashMap<String, String> args = ModalRoute.of(context).settings.arguments;
    final _country = (args ?? const {})['country'] ?? 'United Kingdom';
    final _postCode = (args ?? const {})['postCode'] ?? 'N17 0UL London';
    final _address = (args ?? const {})['address'] ?? '44-48 Garman Rd';

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
                          margin: EdgeInsets.only(top: 40, right: 16, left: 16),
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
                                  "Confirm delivery address",
                                  textAlign: TextAlign.center,
                                  style: AppStyles.font16.copyWith(color: Colors.black),
                                ),
                              )
                            ],
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24, bottom: 24,),
                        child: Text(
                          "${_address}, \n${_postCode} \n${_country}",
                          textAlign: TextAlign.center,
                          style: AppStyles.font12.copyWith(color: AppColors.c212121),
                        ),
                      ),
                      Container(
                        child: RawMaterialButton(
                          constraints: BoxConstraints(),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          child: Text("Change address", style: AppStyles.font12.copyWith(color: AppColors.c00B3DF),),
                          onPressed: onChangeAddress,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(16),
                              child: RaisedGradientButton(
                                child: Text(
                                  "Confirm",
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
                                shadows: [
                                  BoxShadow(
                                    color:
                                    Color.fromARGB(64, 145, 0, 247),
                                    offset: Offset(0, 4),
                                    blurRadius: 10,
                                  )
                                ],
                                onPressed: onConfirm,
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
