import 'package:email_validator/email_validator.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/material.dart';

class EnterEmail extends StatefulWidget {
  EnterEmail({Key key}) : super(key: key);

  @override
  _EnterEmailState createState() => _EnterEmailState();
}

class _EnterEmailState extends State<EnterEmail> {
  final emailController = TextEditingController();
  bool canContinue = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController.addListener(validate);
  }

  @override
  void dispose() {
   
    super.dispose();
    emailController.dispose();
  }

  //
  void validate() {
    print("called");
    String email = emailController.text;
    if ((email?.isNotEmpty ?? true) && EmailValidator.validate(email)) {
      setState(() {
        canContinue = true;
      });
    } else {
      canContinue = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: IntrinsicHeight(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("Enter email to get statement",
                    style:
                        AppStyles.font24.copyWith(fontWeight: FontWeight.bold)),
              )),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        onFieldSubmitted: (term) {
                          _formKey.currentState.validate();
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: AppStyles.font16,
                        cursorWidth: 1,
                        cursorColor: AppColors.c212121,
                        validator: (value) {
                          if (!EmailValidator.validate(value)) {
                            return "Please enter valid Email";
                          }
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey[500])),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
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
                    onPressed: () {
                      if (canContinue == true) {
                        Navigator.of(context).pushNamed('statementsent');
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
