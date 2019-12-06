import 'package:fluencybank/components/circular_image.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paymenthome extends StatefulWidget {
  Paymenthome({Key key}) : super(key: key);

  @override
  _PaymenthomeState createState() => _PaymenthomeState();
}

class _PaymenthomeState extends State<Paymenthome> {

  bool isCompany = false;
  bool canContinue = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController sortCodeController = TextEditingController();

  @override
  void initState() { 
    super.initState();
    fullNameController.addListener(validate);
    accountNumberController.addListener(validate);
    sortCodeController.addListener(validate);
  }
  @override
  void dispose() { 
    fullNameController.dispose();
    accountNumberController.dispose();
    sortCodeController.dispose();
    super.dispose();
  }



  validate(){
    var name = fullNameController.text;
    var accnumber = accountNumberController.text;
    var sortcode = sortCodeController.text;
//_formKey.currentState.validate()
   if (name.isNotEmpty && accnumber.isNotEmpty && sortcode.isNotEmpty) {
     setState(() {
       canContinue = true;
     }); 
   }
   else
   {
     setState(() {
       canContinue = false;
     });
   }

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("New recipent",style: AppStyles.font20,),
          centerTitle: true,
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
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Choose the country and currency and add account details",
                              style:AppStyles.font24.copyWith(fontWeight:FontWeight.w600)),
                              Padding(
                                padding: EdgeInsets.only(top: 30),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Expanded(
                                                                              child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(bottom: BorderSide(color: Colors.grey[500]))
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Text("Country",style:TextStyle(color: Colors.grey[500])),
                                                Container(
                                                  margin: EdgeInsets.only(top: 10,bottom: 10),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(image: AssetImage("assets/images/eng.png")),
                                                        ),
                                                        height: 20,
                                                        width: 20,
                                                        
                                                      ),
                                                      Expanded(
                                                                                                              child: Padding(
                                                          padding: const EdgeInsets.only(left :8.0),
                                                          child: Text("United Kingdom...",style:AppStyles.font20.copyWith(fontWeight: FontWeight.w500)),
                                                        ),
                                                      ),
                                                      Icon(Icons.keyboard_arrow_right,color: Colors.grey[600]),
                                                    ],
                                                  ),
                                                )

                                              ],
                                            ),
                                          ),
                                      ),


                                      Padding(
                                        padding: const EdgeInsets.only(left : 10.0),
                                        child: Container(
                                          
                                          decoration: BoxDecoration(
                                            
                                            border: Border(bottom: BorderSide(color: Colors.grey[500]))
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Text("Currency",style:TextStyle(color: Colors.grey[500])),
                                              Container(
                                                margin: EdgeInsets.only(top: 10,bottom: 10),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text("GBP",style:AppStyles.font20.copyWith(fontWeight: FontWeight.w500)),
                                                    Icon(Icons.keyboard_arrow_right,color: Colors.grey[600]),
                                                  ],
                                                ),
                                              )

                                            ],
                                          ),
                                        ),
                                      ),                                
                                    ],
                                  ),
                                ),
                              ),

                              //// 
                                  Padding(
                                    padding: EdgeInsets.only(top: 30),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Is this a company ?",style:AppStyles.font20.copyWith(fontWeight: FontWeight.w500)),
                                           CupertinoSwitch(
                                                          value:
                                                              isCompany,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              isCompany =
                                                                  value;
                                                            });
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                        ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: 30),
                                    child: Text("Recipient's full name as it appears on their government-issued ID required.",style:AppStyles.font16.copyWith(fontWeight: FontWeight.w500)),
                                  ),

                                 Padding(
            padding: EdgeInsets.only(top : 10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top :8.0),
                    child: TextFormField(
                      controller: fullNameController,
                      validator: (value) {
                        if (value == " " || value.isEmpty) {
                          return "Please enter your Full Name";
                        } else if (value.contains(" ")) {
                          return "Please enter name without Space";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelStyle: AppStyles.font16.copyWith(color: Colors.grey[600],fontWeight: FontWeight.w500),
                        labelText: "Full Name",
                        hintText: "Full Name",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top :8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: accountNumberController,
                        validator: (value) {
                          if (value == " " || value.isEmpty) {
                            return "Please enter your Account Number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelStyle: AppStyles.font16.copyWith(color: Colors.grey[600],fontWeight: FontWeight.w500),
                          labelText: "Account number",
                          hintText: "Account number",
                        ),
                      ),
                    ),
                  ),

                      Padding(
                    padding: EdgeInsets.only(top :8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: sortCodeController,
                        validator: (value) {
                          if (value == " " || value.isEmpty) {
                            return "Please enter your Code";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Sort code",
                          labelStyle: AppStyles.font16.copyWith(color: Colors.grey[600],fontWeight: FontWeight.w500),
                          hintText: "Sort code",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

                                  ////Bottom Button
                                  Container(
                                margin: EdgeInsets.all(16),
                                child: RaisedGradientButton(
                                  child: Text(
                                    "Next",
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
                                      Navigator.of(context).pushNamed("BankTransfer1");
                                    }
                                  },
                                ),
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
                            )
                            );
  }
}