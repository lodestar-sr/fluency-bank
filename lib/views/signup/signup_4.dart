import 'package:flutter/material.dart';
import 'package:wealthpal/components/country_picker/country_code.dart';
import 'package:wealthpal/components/country_picker/country_code_picker.dart';
import 'package:wealthpal/components/raised_gradient_button.dart';
import 'package:wealthpal/components/selection_address_dialog.dart';
import 'package:wealthpal/utils/globals.dart';
import 'package:wealthpal/views/theme.dart';

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
    Globals.postCode = postCodeController.text;
    Globals.address = addressController.text;

    Navigator.of(context).pushNamed('signup_end');
  }

  onCountryCodeChange(CountryCode countryCode) {
    setState(() {
      Globals.country = countryCode;
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
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 28, right: 16, left: 16),
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
                        margin: EdgeInsets.only(top: 20),
                        child: Text("What’s your home address?", style: AppStyles.font16),
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
                                        colors: [AppColors.c9100F7, AppColors.c7427F2],
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
