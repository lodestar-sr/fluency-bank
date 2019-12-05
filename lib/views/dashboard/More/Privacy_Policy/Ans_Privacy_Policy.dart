import 'dart:collection';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/material.dart';

class Ans_Privacy_Policy extends StatefulWidget {
  Ans_Privacy_Policy({Key key}) : super(key: key);

  @override
  _Ans_Privacy_PolicyState createState() => _Ans_Privacy_PolicyState();
}

class _Ans_Privacy_PolicyState extends State<Ans_Privacy_Policy> {
  @override
  Widget build(BuildContext context) {
    var privacyPolicyAns  = "";
    final LinkedHashMap<String, String> args =
        ModalRoute.of(context).settings.arguments;
    setState(() {
      privacyPolicyAns = args['privacyPolicyAns'];    
    });
    return Container(
      color: Colors.white,
      child: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
              child: SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),

                      //Removed Intrinsic height
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("$privacyPolicyAns",style: AppStyles.font24.copyWith(fontWeight: FontWeight.w600),),
                              Padding(
                                padding: EdgeInsets.only(top:  30),
                                child: Text("We're committed to protecting and respecting your privacy.\n\nIf you have any questions about your personal information, please chat with us through the Fluency app or email us at help@fluency.io.\n\n We will help you by providing this FREE terms and conditions generator. Fill in the blank fields below, and we will email you your personalized terms and conditions just for you and your business. The accuracy of the generated document on this website is not legally binding. Use at your own risk.\n\nThis privacy policy will inform you as to how we look after your personal data when you:\n\n• Visit our website www.fluency.io (Site) (regardless of where you visit it from);\n• Use our Fluency mobile application (App) once you have downloaded orstreamed a copy of the App onto your mobile telephone or handheld device;\n• Use any of the services accessible through the App or the Site (the Services)and tell you about your privacy rights and how the law protects you."
                                ,style: AppStyles.font20.copyWith(color: Colors.grey[600]),),
                              )

                            ]
                            )
                            )
                            )
                            )
                            )
                            );
                            }
                            )
                            )
                            ),
    );
  }
}