import 'dart:collection';

import 'package:fluencybank/views/theme.dart';
import 'package:flutter/material.dart';

class FaqAnswers extends StatefulWidget {
  FaqAnswers({Key key}) : super(key: key);

  @override
  _FaqAnswersState createState() => _FaqAnswersState();
}

class _FaqAnswersState extends State<FaqAnswers> {
  @override
  Widget build(BuildContext context) {
    var question  = "";
    final LinkedHashMap<String, String> args =
        ModalRoute.of(context).settings.arguments;
    setState(() {
      question = args['question'];    
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
                              Text("$question",style: AppStyles.font24.copyWith(fontWeight: FontWeight.w600),),
                              Padding(
                                padding: EdgeInsets.only(top:  30),
                                child: Text("Once you have activated your cryptocurrency account, you can use any supported fiat currency to exchange with cryptocurrencies.\n\nWith Fluency, you can instantly convert your cryptocurrency from and to fiat."
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