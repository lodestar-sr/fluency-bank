import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/utils/globals.dart';
import 'package:fluencybank/views/theme.dart';

class Signup3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Signup3State();
}

class _Signup3State extends State<Signup3> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dobController = TextEditingController();

  bool canContinue = false;

  @override
  void initState() {
    super.initState();

    firstNameController.addListener(validateForm);
    lastNameController.addListener(validateForm);
    dobController.addListener(validateForm);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();

    super.dispose();
  }

  validateForm() {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String dob = dobController.text;

    if ((firstName?.isNotEmpty ?? true) &&
        (lastName?.isNotEmpty ?? true) &&
        (dob?.isNotEmpty ?? true)) {
      setState(() {
        canContinue = true;
      });
    } else {
      setState(() {
        canContinue = false;
      });
    }
  }

  onContinue() {
    Globals.firstName = firstNameController.text;
    Globals.lastName = lastNameController.text;
    Globals.dob = dobController.text;

    Navigator.of(context).pushNamed('signup_4');
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
                            Text("Step 3 of 5", style: AppStyles.font12),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 16, right: 16),
                        child: Text("What are your personal details?",
                            style: AppStyles.font24),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                        width: double.infinity,
                        child: TextField(
                          controller: firstNameController,
                          cursorWidth: 1,
                          cursorColor: AppColors.c212121,
                          decoration: AppStyles.inputBorderDecoration.copyWith(
                            labelText: "First name",
                          ),
                          style: AppStyles.font14,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                        width: double.infinity,
                        child: TextField(
                          controller: lastNameController,
                          cursorWidth: 1,
                          cursorColor: AppColors.c212121,
                          decoration: AppStyles.inputBorderDecoration.copyWith(
                            labelText: "Last name",
                          ),
                          style: AppStyles.font14,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                        width: double.infinity,
                        child: DateTimeField(
                          controller: dobController,
                          format: DateFormat('dd/MM/yyyy'),
                          style: AppStyles.font14,
                          cursorWidth: 1,
                          cursorColor: AppColors.c212121,
                          decoration: AppStyles.inputBorderDecoration.copyWith(
                            labelText: "Date of birth",
                            hintText: "Date of birth (DD/MM/YYYY)",
                            contentPadding: EdgeInsets.only(top: 0),
                          ),
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime.now(),
                            );
                          },
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
                                        colors: [
                                          AppColors.c00B3DF,
                                          AppColors.c00B3DF
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      )
                                    : LinearGradient(
                                        colors: [
                                          AppColors.cBDBDBD,
                                          AppColors.cBDBDBD
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
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
