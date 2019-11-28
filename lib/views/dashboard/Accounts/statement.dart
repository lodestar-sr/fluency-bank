import 'dart:collection';

import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart'
    as prefix;
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Statement extends StatefulWidget {
  Statement({Key key}) : super(key: key);

  @override
  _StatementState createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  var currencyText;

  String _date = "";
  String datefrom = "";
  String dateto = "";
  var selectecfrom;
  var month;
  var name;
  var selectedformat = "";
  bool canContinue = false;

  var monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  @override
  void initState() {
    super.initState();
  }

  //Validating
  void validate() {
    print("function called");
    if (dateto != "" && datefrom != "" && selectedformat != "") {
      setState(() {
        canContinue = true;
      });
    } else {
      setState(() {
        canContinue = false;
      });
    }
  }

  //return date String
  String check(String month) {
    switch (month) {
      case "1":
        {
          name = monthNames[0];
        }
        break;
      case "2":
        {
          name = monthNames[1];
        }
        break;
      case "3":
        {
          name = monthNames[2];
        }
        break;
      case "4":
        {
          name = monthNames[3];
        }
        break;
      case "5":
        {
          name = monthNames[4];
        }
        break;
      case "6":
        {
          name = monthNames[5];
        }
        break;
      case "7":
        {
          name = monthNames[6];
        }
        break;
      case "8":
        {
          name = monthNames[7];
        }
        break;
      case "9":
        {
          name = monthNames[8];
        }
        break;
      case "10":
        {
          name = monthNames[9];
        }
        break;
      case "11":
        {
          name = monthNames[10];
        }
        break;
      case "12":
        {
          name = monthNames[11];
        }
        break;
    }
    return name;
  }

  void showdatepicker() {
    DatePicker.showDatePicker(context,
        theme: DatePickerTheme(
          containerHeight: 210.0,
        ),
        showTitleActions: true,

        //minTime: DateTime(2000, 1, 1),
        maxTime: DateTime.now(), onConfirm: (date) {
      print('confirm $date');

      setState(() {
        _date = ' ${check(date.month.toString())}  ${date.year} ';
        if (selectecfrom == 1) {
          datefrom = _date;
        } else {
          dateto = _date;
        }
      });
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  @override
  Widget build(BuildContext context) {
    //currencyText
    final LinkedHashMap<String, String> args =
        ModalRoute.of(context).settings.arguments;
    setState(() {
      currencyText = args['currencyText'];
      print("This is the currency text $currencyText");
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
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
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "$currencyText statement",
                                style: AppStyles.font28
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Text(
                                  "From",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 18.0,
                                      fontFamily: 'Gilroy'),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[600],
                                            width: 0.5))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Expanded(
                                        child: GestureDetector(
                                            onTap: () {
                                              print("object");
                                              selectecfrom = 1;
                                              showdatepicker();
                                              validate();

                                              //////////////// Date 1
                                            },
                                            child: datefrom == ""
                                                ? Text("Choose Date",
                                                    style: TextStyle(
                                                        color: Colors.grey[300],
                                                        fontFamily: 'Gilroy',
                                                        fontSize: 20.0))
                                                : Text(
                                                    "$datefrom",
                                                    style: AppStyles.font22,
                                                  )),
                                      ),
                                      Icon(Icons.arrow_forward_ios,
                                          color: Colors.black, size: 15.0)
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Text(
                                  "To",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 18.0,
                                      fontFamily: 'Gilroy'),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[600],
                                            width: 0.5))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Expanded(
                                        child: GestureDetector(
                                            onTap: () {
                                              //////////////// Date 2
                                              selectecfrom = 2;
                                              showdatepicker();
                                              validate();
                                            },
                                            child: dateto == ""
                                                ? Text("Choose Date",
                                                    style: TextStyle(
                                                        color: Colors.grey[300],
                                                        fontFamily: 'Gilroy',
                                                        fontSize: 20.0))
                                                : Text(
                                                    "$dateto",
                                                    style: AppStyles.font22,
                                                  )),
                                      ),
                                      Icon(Icons.arrow_forward_ios,
                                          color: Colors.black, size: 15.0)
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Text(
                                  "Statement format",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 18.0,
                                      fontFamily: 'Gilroy'),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[600],
                                            width: 0.5))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Expanded(
                                        child: GestureDetector(
                                            onTap: () {
                                              _settingbottomsheet(context);
                                              validate();
                                              
                                            },
                                            child: selectedformat == ""
                                                ? Text("Choose format",
                                                    style: TextStyle(
                                                        color: Colors.grey[300],
                                                        fontFamily: 'Gilroy',
                                                        fontSize: 20.0))
                                                : Text(
                                                    "$selectedformat",
                                                    style: AppStyles.font22,
                                                  )),
                                      ),
                                      Icon(Icons.arrow_forward_ios,
                                          color: Colors.black, size: 15.0)
                                    ],
                                  ),
                                ),
                              ),

                              //
                              Expanded(
                                child: Align(
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
                                        onPressed: () {
                                          if (canContinue == true) {
                                            Navigator.of(context).pushNamed(
                                              'enteremail',
                                            );
                                          }
                                        }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))));
      }),
    );
  }

  void _settingbottomsheet(BuildContext context) {
    var selected;
    showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  
                  children: <Widget>[
                    Text("Format",style: AppStyles.font16,),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          selectedformat = selected;
                          validate();
                        });
                      },
                      child: Text("Done",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromRGBO(0, 122, 255, 1))),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    height: 100.0,
                    child: CupertinoPicker(
                      backgroundColor: Colors.white,
                      children: <Widget>[
                        Text("Excel"),
                        Text("Pdf"),
                      ],
                      itemExtent: 50,
                      onSelectedItemChanged: (int index) {
                        print(index);
                        if (index == 1) {
                          selected = "Pdf";
                        } else {
                          selected = "Excel";
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
