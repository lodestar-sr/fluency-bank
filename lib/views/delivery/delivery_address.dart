import 'package:flutter/material.dart';
import 'package:fluencybank/components/country_picker/country_code.dart';
import 'package:fluencybank/components/country_picker/country_code_picker.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/components/selection_address_dialog.dart';
import 'package:fluencybank/views/theme.dart';

class DeliveryAddress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DeliveryAddressState();
  }
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  final postCodeController = TextEditingController();
  final addressController = TextEditingController();

  String _country = "United Kingdom";
  String _address = "";
  bool canContinue = false;
  bool manualInput = false;

  @override
  void initState() {
    super.initState();

    postCodeController.addListener(validateForm);
    addressController.addListener(validateForm);
  }

  @override
  void dispose() {
    postCodeController.dispose();
    addressController.dispose();

    super.dispose();
  }

  validateForm() {
    String postCode = postCodeController.text;
    String address = addressController.text;

    if ((postCode?.isNotEmpty ?? true) && (address?.isNotEmpty ?? true)) {
      setState(() {
        canContinue = true;
      });
    } else {
      setState(() {
        canContinue = false;
      });
    }
  }

  onTapAddress() {
    List<String> elements = [
      "3 Westferry Circus, London",
      "4 St Martin-in-the-Fields Church Path , London",
      "15 Westferry Circus, London",
    ];
    showDialog(
      context: context,
      builder: (_) => SelectionAddressDialog(elements),
    ).then((ret) {
      if (ret != null) {
        setState(() {
          if (ret == "Manual Address Input") {
            manualInput = true;
          } else {
            _address = ret;
            addressController.text = ret;
          }
        });
      }
    });
  }

  onContinue() {
    Navigator.of(context).pushNamed('confirm_delivery_address', arguments: <String, String>{
      'country': _country,
      'postCode': postCodeController.text,
      'address': addressController.text,
    });
  }

  onCountryCodeChange(CountryCode countryCode) {
    setState(() {
      _country = countryCode.name;
    });
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
                        margin: EdgeInsets.only(top: 40, right: 16, left: 8),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Image.asset(
                                "assets/images/arrow_back.png",
                                width: 24,
                                height: 24,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Add pick up \nthe delivery address",
                                style: AppStyles.font16.copyWith(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 44, left: 16, right: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppColors.cBDBDBD))),
                        child: CountryCodePicker(
                          initialSelection: 'GB',
                          onChanged: onCountryCodeChange,
                          showCountryOnly: true,
                          showOnlyCountryWhenClosed: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 16, right: 16),
                        width: double.infinity,
                        child: TextField(
                          controller: postCodeController,
                          keyboardType: TextInputType.number,
                          style: AppStyles.font14,
                          cursorWidth: 1,
                          cursorColor: AppColors.c212121,
                          decoration: AppStyles.inputBorderDecoration.copyWith(
                            hintText: "Post code",
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 16, right: 16),
                        width: double.infinity,
                        child: TextField(
                          controller: addressController,
                          style: AppStyles.font14,
                          cursorWidth: 1,
                          cursorColor: AppColors.c212121,
                          decoration: AppStyles.inputBorderDecoration.copyWith(
                            hintText: "Address",
                          ),
                          onTap: manualInput ? null : onTapAddress,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(16),
                              child: RaisedGradientButton(
                                child: Text("Continue", style: AppStyles.buttonTextStyle),
                                gradient: canContinue
                                    ? LinearGradient(
                                  colors: [AppColors.c00B3DF, AppColors.c00B3DF],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                )
                                    : LinearGradient(
                                  colors: [AppColors.cBDBDBD, AppColors.cBDBDBD],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                shadows: canContinue
                                    ? [
                                  BoxShadow(
                                    color: Color.fromARGB(64, 145, 0, 247),
                                    offset: Offset(0, 4),
                                    blurRadius: 10,
                                  )
                                ]
                                    : [
                                  BoxShadow(
                                    color: AppColors.cBDBDBD,
                                    offset: Offset(0, 4),
                                    blurRadius: 10,
                                  )
                                ],
                                onPressed: canContinue ? onContinue : null,
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
