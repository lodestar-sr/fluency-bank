import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:wealthpal/components/country_picker/country_code.dart';
import 'package:wealthpal/components/country_picker/country_code_picker.dart';
import 'package:wealthpal/components/raised_gradient_button.dart';
import 'package:wealthpal/views/theme.dart';

class Signup1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Signup1State();
}

class _Signup1State extends State<Signup1> {

  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  bool canContinue = false;
  String _code = "+44";

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    phoneController.addListener(validateForm);
    emailController.addListener(validateForm);
  }

  submitSignup() {
    String phone = phoneController.text;
    String email = emailController.text;

    Navigator.of(context).pushNamed('signup_2', arguments: <String, String>{
      "phone": _code + phone,
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
      _code = countryCode.dialCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 28, right: 16),
            alignment: Alignment.centerRight,
            height: 16,
            child: Text("Step 1 of 4", style: AppStyles.stepTextStyle),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Center(
              child: Image.asset("assets/images/logo_title.png", width: 198),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 54),
            child: Text("Create a free account", style: AppStyles.titleGrayStyle),
          ),
          Container(
            margin: EdgeInsets.only(top: 34, right: 16, left: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppColors.cBDBDBD))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Country", style: AppStyles.inputLabelStyle),
                      CountryCodePicker(
                        initialSelection: 'GB',
                        onChanged: onCountryCodeChange,
                      )
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
                        Text("Phone number", style: AppStyles.inputLabelStyle),
                        TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          style: AppStyles.inputTextStyle,
                          cursorWidth: 1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 8, top: 12.5),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.c8B42FF)),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.cBDBDBD)),
                          ),
                        ),
                      ],
                    ),
                  )
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
                Text("Email", style: AppStyles.inputLabelStyle),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: AppStyles.inputTextStyle,
                  cursorWidth: 1,
                  cursorColor: AppColors.c212121,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 8, top: 8,),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.c8B42FF)),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.cBDBDBD)),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: RaisedGradientButton(
                    child: Text("Continue", style: AppStyles.buttonTextStyle,),
                    gradient: canContinue ?
                      LinearGradient(
                        colors: [AppColors.c9100F7, AppColors.c7427F2],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                      :
                      LinearGradient(
                        colors: [AppColors.cBDBDBD, AppColors.cBDBDBD],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    shadows: canContinue ? [
                      BoxShadow(
                        color: Color.fromARGB(64, 145, 0, 247),
                        offset: Offset(0, 4),
                        blurRadius: 10,
                      )
                    ]
                    :
                    [
                      BoxShadow(
                        color: AppColors.cBDBDBD,
                        offset: Offset(0, 4),
                        blurRadius: 10,
                      )
                    ],
                    onPressed: canContinue ? submitSignup : null,
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}