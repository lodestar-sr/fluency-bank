import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluencybank/components/country_picker/country_code.dart';
import 'package:fluencybank/components/country_picker/country_code_picker.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/utils/globals.dart';
import 'package:fluencybank/utils/utils.dart';
import 'package:fluencybank/views/theme.dart';

class Signup1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Signup1State();
}

class _Signup1State extends State<Signup1> {
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  bool canContinue = false;
  String phoneCode = "+93";
  bool isLoading = false;

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    phoneController.addListener(validateForm);
    emailController.addListener(validateForm);
  }

  submitSignup() {
    setState(() {
      isLoading = true;
    });
    Globals.phoneNumber = phoneController.text;
    Globals.email = emailController.text;
    String phone = phoneController.text;

    getVerificationCode(phoneCode + phone).then((code) {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushNamed('signup_2', arguments: <String, String>{
        "phone": phoneCode + phone,
        "code": code.toString(),
      });
    }).catchError((_) {
      setState(() {
        isLoading = false;
      });
      return showSimpleAlert(context: context, message: 'Please input valid phone number. \nFormat: +[code][phonenumber]');
    });
  }

  validateForm() {
    String email = emailController.text;
    String phone = phoneController.text;

    if ((email?.isNotEmpty ?? true) && (phone?.isNotEmpty ?? true) && EmailValidator.validate(email)) {
      setState(() {
        canContinue = true;
      });
    } else {
      setState(() {
        canContinue = false;
      });
    }
  }

  onCountryCodeChange(CountryCode countryCode) {
    setState(() {
      Globals.countryInfo = countryCode;
      phoneCode = countryCode.dialCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
      inAsyncCall: isLoading,
      color: AppColors.c00B3DF,
      progressIndicator: CircularProgressIndicator(),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 40, right: 16),
                        alignment: Alignment.centerRight,
                        child: Text("Step 1 of 5", style: AppStyles.font12),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 72, left: 16),
                        child: Image.asset("assets/images/logo_title.png", height: 48),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8, left: 16),
                        child: Text("Create a free account", style: AppStyles.font24),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 84, right: 16, left: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppColors.cBDBDBD))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Country", style: AppStyles.font12),
                                  Container(
                                    width: 84,
                                    child: CountryCodePicker(
                                      autoInitial: true,
                                      onChanged: onCountryCodeChange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
//                                      Text("Phone number",
//                                          style: AppStyles.font12),
                                    TextField(
                                      controller: phoneController,
                                      keyboardType: TextInputType.phone,
                                      style: AppStyles.font16,
                                      cursorWidth: 1,
                                      cursorColor: AppColors.c212121,
                                      decoration: AppStyles.inputBorderDecoration.copyWith(
                                        labelText: 'Phone number',
                                        contentPadding: EdgeInsets.only(bottom: 12, top: 4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16, right: 16, left: 16),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
//                              Text("Email", style: AppStyles.font12),
                            TextField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: AppStyles.font16,
                              cursorWidth: 1,
                              cursorColor: AppColors.c212121,
                              decoration: AppStyles.inputBorderDecoration.copyWith(labelText: 'Email'),
                            ),
                          ],
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
                                  "Continue",
                                  style: AppStyles.buttonTextStyle,
                                ),
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
                                onPressed: canContinue ? submitSignup : null,
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
    ));
  }
}
