import 'package:flutter/material.dart';
import 'package:wealthpal/components/raised_gradient_button.dart';
import 'package:wealthpal/country_picker/country_code_picker.dart';

import '../theme.dart';

class Signup1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Signup1State();
}

class _Signup1State extends State<Signup1> {

  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 28, right: 16),
            alignment: Alignment.centerRight,
            height: 16,
            child: Text("Step 1 of 5", style: AppStyles.stepTextStyle),
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
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppColors.underlineColor))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Country", style: AppStyles.inputLabelStyle),
                      CountryCodePicker(
                        initialSelection: 'IT',
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
                          style: AppStyles.inputTextStyle,
                          cursorWidth: 1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 8, top: 12.5),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.activeUnderlineColor))
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
                  style: AppStyles.inputTextStyle,
                  cursorWidth: 1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 8, top: 8,),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.activeUnderlineColor))
                  ),
                ),
              ],
            ),
          ),
          RaisedGradientButton(
            child: Text("Continue", style: AppStyles.buttonTextStyle,),
            gradient: LinearGradient(
              colors: [Color(0xFF9100F7), Color(0xFF7427F2)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            margin: EdgeInsets.only(left: 16, right: 16),
            onPressed: null,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}