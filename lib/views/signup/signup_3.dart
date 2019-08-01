import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wealthpal/views/theme.dart';

class Signup3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Signup3State();
}

class _Signup3State extends State<Signup3> {

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 28, right: 16, left: 16),
            alignment: Alignment.centerRight,
            height: 16,
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
                Text("Step 3 of 4", style: AppStyles.stepTextStyle),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text("What are your personal details?",
                style: AppStyles.dialogTitleStyle),
          ),
          Container(
            margin: EdgeInsets.only(top: 44, left: 16, right: 16),
            width: double.infinity,
            child: TextField(
              controller: firstNameController,
              cursorWidth: 1,
              decoration: InputDecoration(
                hintText: "First name"
              ),
              style: AppStyles.inputTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 16, right: 16),
            width: double.infinity,
            child: TextField(
              controller: lastNameController,
              cursorWidth: 1,
              decoration: InputDecoration(
                hintText: "Last name"
              ),
              style: AppStyles.inputTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 16, right: 16),
            width: double.infinity,
            child: DateTimeField(
              format: DateFormat('dd/MM/yyyy'),
              cursorWidth: 1,
              decoration: InputDecoration(
                hintText: "Date of birth (DD/MM/YYYY)",
              ),
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
              style: AppStyles.inputTextStyle,
            )
          ),
        ],
      ),
    );
  }
}
