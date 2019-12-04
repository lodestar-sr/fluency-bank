import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluencybank/components/country_picker/country_code_picker.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/components/verification_code_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:fluencybank/views/theme.dart';

class PersonalDetails extends StatefulWidget {
  PersonalDetails({Key key}) : super(key: key);

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController fullname = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController postalcode = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController email = TextEditingController();
  bool _edit = false;
  Color check ;
  bool canContinue = false;
  bool obscurePasscode = true;
  bool canContinueModel = false;

  

  @override
  void initState() { 
    super.initState();
    fullname.addListener(validateForm);
    dob.addListener(validateForm);
    country.addListener(validateForm);
    postalcode.addListener(validateForm);
    address.addListener(validateForm);
    phoneno.addListener(validateForm);
    email.addListener(validateForm);
     setState(() {
      fullname.text = "Alex Luna";
      dob.text = "04/07/1991";
      country.text = "United Kingdom";
      postalcode.text = "72046";
      address.text = "A4,London WC2N 5DU,UK";
      phoneno.text = "9898986767";
      email.text = "lunasmail@mail.com";
      
    });
    if (_edit == true)
    {
     setState(() {
       check = Colors.black;
     });
    }
    else
    {
      setState(() {
       check = Colors.grey[600];
     });
    }
  }

  //Toggle password state 
  onTogglePasscode() {
    setState(() {
      obscurePasscode = !obscurePasscode;
    });
  }

   completeInputCode(String code) {

    print("This is the code ${code.length}");
    if (code.length == 4) {
      setState(() {
        canContinueModel = true;
      });
      
    } else {
      canContinueModel = false;
    }
  }



  validateForm() {
    String emailId = email.text;
    String phone = phoneno.text;
    String name = fullname.text;
    String countryname = country.text;
    String postalCode = postalcode.text;
    String addresss = address.text;
    String birthday = dob.text;

    if ((emailId?.isNotEmpty ?? true) && (phone?.isNotEmpty ?? true) && EmailValidator.validate(emailId) && (name?.isNotEmpty ?? true) && (countryname?.isNotEmpty ?? true)
     && (postalCode?.isNotEmpty ?? true) && (addresss?.isNotEmpty ?? true) && (birthday?.isNotEmpty ?? true)) {
      setState(() {
        canContinue = true;
      });
    } else {
      setState(() {
        canContinue = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullname.dispose();
    dob.dispose();
    country.dispose();
    postalcode.dispose();
    address.dispose();
    phoneno.dispose();
    email.dispose();
  }
  @override
  Widget build(BuildContext context) {
   
    return Container(
      color: Colors.white,
      child: SafeArea(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return Scaffold(
          appBar: AppBar(
        
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
              body: GestureDetector(
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
                    Text("Your personal details",
                                    style: AppStyles.font24
                                        .copyWith(fontWeight: FontWeight.bold)
                        ),

                        //Full Name
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Full name",style:AppStyles.font16.copyWith(color:Colors.grey[500])),
                        ),
                        TextFormField(
                          enabled: _edit,
                          controller: fullname,
                          style: AppStyles.font20.copyWith(color: check),
                          decoration: InputDecoration(
                          ),
                        ),

                        //Dob 
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Birthday",style:AppStyles.font16.copyWith(color:Colors.grey[500])),
                        ),
                        DateTimeField(
                          enabled: _edit,
                          controller: dob,
                          keyboardType: TextInputType.datetime,
                          format: DateFormat('dd/MM/yyyy'),
                          style: AppStyles.font20.copyWith(color: check),
                          cursorWidth: 1,
                          cursorColor: AppColors.c212121,
                          decoration: AppStyles.inputBorderDecoration.copyWith(                          
                            hintText: "Date of birth (DD/MM/YYYY)",                           
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
                        //Country
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Country",style:AppStyles.font16.copyWith(color:Colors.grey[500])),
                        ),
                        TextFormField(
                          enabled: _edit,
                          controller: country,
                          style: AppStyles.font20.copyWith(color: check),
                          decoration: InputDecoration(
                            prefixIcon: Container(height: 2.0,
                            width: 2.0,
                            margin: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.0),
                                              image: DecorationImage(image: ExactAssetImage("assets/images/eng.png"),
                                              fit: BoxFit.scaleDown)
                                            ),
                              
                              ),
                              suffixIcon: Icon(Icons.keyboard_arrow_right,color: check,)
                          ),
                        ),
                        
                        //Postal code
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Postal code",style:AppStyles.font16.copyWith(color:Colors.grey[500])),
                        ),
                        TextFormField(
                          enabled: _edit,
                          keyboardType: TextInputType.phone,
                          controller: postalcode,
                          style: AppStyles.font20.copyWith(color: check),
                          decoration: InputDecoration(
                          ),
                        ),
                        //Address
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Address",style:AppStyles.font16.copyWith(color:Colors.grey[500])),
                        ),
                        TextFormField(
                          enabled: _edit,
                          controller: address,
                          style: AppStyles.font20.copyWith(color: check),
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.keyboard_arrow_right,color: check)
                          ),
                        ),  
                        //Phone no
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Phone no",style:AppStyles.font16.copyWith(color:Colors.grey[500])),
                        ),
                        Container(
                         
                          child: Row(
                            children: <Widget>[
                             _edit == true ? Container(
                                      width: 69,
                                      child: CountryCodePicker(
                                        autoInitial: true,
                                        //onChanged: onCountryCodeChange,
                                      ),
                                    ) : Container(
                                      height: 69,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            height: 20,
                                            width: 20,
                                            
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.0),
                                              image: DecorationImage(image: ExactAssetImage("assets/images/eng.png"),
                                              fit: BoxFit.scaleDown)
                                            ),
                                          ),
                                          Icon(Icons.keyboard_arrow_down,color :check),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10.0),
                                            child: Text("+44",style:TextStyle(color: check,fontSize:20.0)),
                                          )
                                        ],
                                      ),
                                    ),
                              Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left : 10.0),
                                                                child: TextFormField(
                                  enabled: _edit,
                                  controller: phoneno,
                                  keyboardType: TextInputType.phone,
                                  style: AppStyles.font20.copyWith(color: check),
                                  decoration: InputDecoration(
                                  ),
                                ),
                                                              ),
                              ),
                            ],
                          ),
                        ),
                           //Email 
                           Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Email",style:AppStyles.font16.copyWith(color:Colors.grey[500])),
                        ),
                        TextFormField(
                          enabled: _edit,
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          style: AppStyles.font20.copyWith(color: check),
                          decoration: InputDecoration(
                            
                          ),
                        ), 

                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child:  Visibility(
                                         visible: _edit,
                                         replacement: Container(
                                           decoration: BoxDecoration(
                                             border: Border.all(color: AppColors.c00B3DF,width: 2.0),
                                             borderRadius: BorderRadius.circular(25.0)
                                           ),
                                          margin: EdgeInsets.all(16),
                                          child: RaisedGradientButton(
                                            child: Text(
                                              "Edit Details",
                                              style: AppStyles.font18.copyWith(color: AppColors.c00B3DF,fontWeight: FontWeight.w600),
                                            ),
                                            
                                            onPressed: () {
                                              setState(() {
                                               _edit = true;
                                                
                                              });
                                            },
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only( top : 10.0),
                                          child: Container(
                                          margin: EdgeInsets.all(16),
                                          child: RaisedGradientButton(
                                            child: Text(
                                              "Save",
                                              style: AppStyles.buttonTextStyle,
                                            ),
                                            gradient: LinearGradient(
                                              colors: [
                                                AppColors.c00B3DF,
                                                AppColors.c00B3DF
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                               if (canContinue == true)
                                               {
                                                 bottomsheet(context);
                                               }
                                                
                                              });
                                            },
                                          ),
                                        ),
                                        ),
                                       ),
                        )          

                    ]
                    ),
                )
                  )
                  )
                  )
                  ),
        );
                  }
                  )
                  )
                  );
  }

  // Model sheet 
  void bottomsheet(BuildContext context) {
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Padding(
              padding: EdgeInsets.only(
             bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                height: 400.0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 5.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[350],
                            ),
                          ),
                        ),
                      ),
                      Text("Confirm change of personal details",
                          style: AppStyles.font22
                              .copyWith(fontWeight: FontWeight.bold)),
                      
                      //Passcode
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              VerificationCodeInput(
                                keyboardType: TextInputType.number,
                                itemWidth: 40,
                                itemHeight: 56,
                                itemGap: 8,
                                separateMiddle: false,
                                obscure: obscurePasscode,
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                ),
                                onCompleted: (value){
                                  completeInputCode(value);
                                },
                                onChanged: (value){
                                  completeInputCode(value);
                                },
                                
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 24),
                                child: GestureDetector(
                                  child: Image.asset(
                                    obscurePasscode ? 'assets/images/eye-gray.png' : 'assets/images/eye-black.png',
                                    width: 26,
                                  ),
                                  onTap: (){
                                    setState(() {
                                      onTogglePasscode();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Container(
                                margin: EdgeInsets.all(16),
                                child: RaisedGradientButton(
                                  child: Text(
                                    "Confirm",
                                    style: AppStyles.buttonTextStyle,
                                  ),
                                  gradient: canContinueModel
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
                                    if (canContinueModel == true){
                                      Navigator.of(context).pushNamed('PersonalDetailsChangeSuccess');
                                    }
                                  },
                                ),
                              )
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}