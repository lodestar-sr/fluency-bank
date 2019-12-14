import 'package:flutter/material.dart';
import 'package:fluencybank/components/country_picker/country_code.dart';
import 'package:fluencybank/components/country_picker/country_code_picker.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/components/selection_address_dialog.dart';
import 'package:fluencybank/utils/globals.dart';
import 'package:fluencybank/views/theme.dart';

class Signup4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Signup4State();
  }
}

class _Signup4State extends State<Signup4> {
  final postCodeController = TextEditingController();
  final addressController = TextEditingController();

  String _country = "";
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
    showDialog(
      context: context,
      builder: (_) => SelectionAddressDialog(Globals.preAddresses ?? ""),
    ).then((ret) {
      if (ret != null) {
        setState(() {
          if (ret == "Manual Address Input") {
            manualInput = true;
          } else {
            addressController.text = "${ret['streetNumber'] ??""} ${ret['streetName']?? ""}";
            postCodeController.text = ret['postalCode'];
          }
        });
      }
    });
  }

  onContinue() {
    Globals.postCode = postCodeController.text;
    Globals.street = addressController.text;

    Navigator.of(context).pushNamed('signup_end');
  }

  onCountryCodeChange(CountryCode countryCode) {
    setState(() {
      Globals.countryInfo = countryCode;
      _country = countryCode.code;
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 40, right: 16, left: 16),
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Text("Step 4 of 4", style: AppStyles.font12),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 16, right: 16),
                        child: Text("What’s your home address?", style: AppStyles.font24),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                          width: double.infinity,
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppColors.cBDBDBD))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Country", style: AppStyles.font12),
                              CountryCodePicker(
                                initialSelection: Globals.countryInfo?.code ?? "+54",
                                onChanged: onCountryCodeChange,
                                showCountryOnly: true,
                                showOnlyCountryWhenClosed: true,
                              ),
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                        width: double.infinity,
                        child: TextField(
                          controller: postCodeController,
                          keyboardType: TextInputType.number,
                          style: AppStyles.font14,
                          cursorWidth: 1,
                          cursorColor: AppColors.c212121,
                          decoration: AppStyles.inputBorderDecoration.copyWith(
                            labelText: "Post code",
                          ),
                          onTap: manualInput ? null : onTapAddress,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                        width: double.infinity,
                        child: TextField(
                          controller: addressController,
                          style: AppStyles.font14,
                          cursorWidth: 1,
                          cursorColor: AppColors.c212121,
                          decoration: AppStyles.inputBorderDecoration.copyWith(
                            labelText: "Address",
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
                                onPressed: (){
                                  if (canContinue== true){
                                  setState(() {
                                    onContinue();
                                  });
                                } 
                                }  ,
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
