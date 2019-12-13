import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluencybank/views/theme.dart';



class AccountManagement extends StatefulWidget {
  AccountManagement({Key key}) : super(key: key);

  @override
  _AccountManagementState createState() => _AccountManagementState();
}

class _AccountManagementState extends State<AccountManagement> {
  
  var retrivedCryptoCurrency;
  var retrivedCryptoCurrencytype;
  var inActiveRetrivedCryptoCurrency;
  var inActiveRetrivedCryptoCurrencyType;
  List<bool> isSelected = [];
  List<bool> isSelectedInactive = [];
  bool checklistpopulated = false;
  bool checklistpopulatedInactive = false;
  //₿
  getValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    retrivedCryptoCurrency = prefs.getStringList("cryp") ;
    retrivedCryptoCurrencytype = prefs.getStringList("cryptype") ;
    
  });
  }
  getValuesSFInactive() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    inActiveRetrivedCryptoCurrency = prefs.getStringList("crypinactive") ;
    inActiveRetrivedCryptoCurrencyType = prefs.getStringList("cryptypeinactive") ;
   
  });
  }

    //Shared preference 
  addStringToSFActive(List cryp , List cryptype) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList("cryp", cryp);
  prefs.setStringList("cryptype", cryptype);
  }

  //Shared preference 
  addStringToSFInactive(List<String> cryp , List<String> cryptype) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList("crypinactive", cryp);
  prefs.setStringList("cryptypeinactive", cryptype);
  }

  
  var t = false;
  @override
  void initState() { 
    super.initState();
    getValuesSF();
    getValuesSFInactive();
  }
  @override
  Widget build(BuildContext context) {
     
    //   setState(() {
    //   getValuesSF();
    // getValuesSFInactive();
    // });
    
    if (retrivedCryptoCurrency?.isNotEmpty ?? false) {
      
      if (checklistpopulated == false) {
        for(int i = 0 ; i < retrivedCryptoCurrency.length; i++)
    {
      isSelected.add(false);
    }
     checklistpopulated = true;   
      }
      
    } 
    print(retrivedCryptoCurrencytype);

    //Forinactive
    if (inActiveRetrivedCryptoCurrency?.isNotEmpty ?? false) {
      
      if (checklistpopulatedInactive == false) {
        for(int i = 0 ; i < inActiveRetrivedCryptoCurrency.length; i++)
    {
      isSelectedInactive.add(false);
    }
     checklistpopulatedInactive = true;   
      }
      
    }
    
    
    
    return Scaffold(
      appBar: AppBar(
        
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Account Details",
                  style: AppStyles.font24.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
            ),
           Padding(
             padding: EdgeInsets.only(top: 20, left: 15.0, right: 15.0,bottom: 20),
             child: GestureDetector(
               onTap: (){
                setState(() {
                   Navigator.of(context).pushNamed('add_acount');
                });
        
               },
                            child: Container(
                 child: Row(
                   children: <Widget>[
                     Container(
                       height: 50,
                       width: 50,
                       decoration: BoxDecoration(
                         color: Colors.grey[100],
                         borderRadius: BorderRadius.circular(5.0)
                       ),
                       child: Icon(Icons.add,color:Colors.grey[500]),
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 10.0),
                       child: Text("Create new account",style:AppStyles.font18.copyWith(color:Colors.grey[600],fontWeight:FontWeight.w500)),
                     )
                   ],
                 ),
               ),
             ),
           ),
            Padding(
              padding: EdgeInsets.only(top: 18, left: 15.0, right: 15.0),
              child: Text(
                    "Active accounts",
                    style: TextStyle(color: Colors.grey[700], fontSize: 20),
                  ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 18, left: 15.0, right: 15.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                              height: 50.0,
                              width: 50.0,
                              child: Image.asset(
                                "assets/images/eng.png",
                                fit: BoxFit.cover,
                              )),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left :10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("GBP",style: AppStyles.font20.copyWith(
                                          fontWeight: FontWeight.w600)),
                                          Text("£1,000.00",style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 18.0))
                                    ],
                                  ),
                                ),
                              )
                  ],
                ),
              ),
            ),

          retrivedCryptoCurrency?.isEmpty ?? true ? Container() : Padding(
              padding: EdgeInsets.only(top : 0.0),
              child:               
              Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: retrivedCryptoCurrency.length ,
                  itemBuilder: (BuildContext context , int index){
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          isSelected[index] == false ? isSelected[index] = true : isSelected[index] = false;
                        });
                      },
                        child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only( left : 15.0 , top: 10),
                            child: Row(
                  children: <Widget>[
                            Container(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: retrivedCryptoCurrency[index] == "BTC" ? Color.fromRGBO(
                                                          247, 147, 26, 1) : retrivedCryptoCurrency[index] == "BCH" ?Color.fromRGBO(
                                                              141, 195, 81, 1) : Colors.white,
                                      ),
                                      child: Image.asset(
                                        "assets/images/${retrivedCryptoCurrency[index]}.png",
                                        fit: BoxFit.cover,
                                      )),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left :10.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("${retrivedCryptoCurrency[index] ?? ""}",style: AppStyles.font20.copyWith(
                                                  fontWeight: FontWeight.w600)),
                                                  Text("${retrivedCryptoCurrencytype[index] ?? ""}",style: TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 18.0))
                                            ],
                                          ),
                                        ),
                                      )
                  ],
                ),
                          ),
                          Visibility(
                            visible: isSelected[index],
                            child: Container(
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pushNamed('statement',arguments: <String , String>{
                                        'currencyText' : retrivedCryptoCurrency[index]
                                      });
                                    },
                                    child: Container(
                                      height: 80,
                                     color: Color.fromRGBO(0, 179, 223, 1),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              height: 40,
                                              child: Image.asset("assets/images/invoicewhite.png")),
                                            Text("Statement",style:AppStyles.font16.copyWith(color:Colors.white))
                                            
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      bottomsheet(context , retrivedCryptoCurrency[index] , retrivedCryptoCurrencytype[index]);
                                    },
                                    child: Container(
                                      height: 80,
                                     color: Colors.grey[400],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              height: 40,
                                              child: Icon(Icons.clear ,color:Colors.white)),
                                            Text("Deactivate",style:AppStyles.font16.copyWith(color:Colors.white))
                                            
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),  

                 //Inactive account 
                 Padding(
              padding: EdgeInsets.only(top: 18, left: 15.0, right: 15.0),
              child: Text(
                    "Inactive accounts",
                    style: TextStyle(color: Colors.grey[700], fontSize: 20),
                  ),
            ),
            
            inActiveRetrivedCryptoCurrency?.isEmpty ?? true ? Container() : Padding(
              padding: EdgeInsets.only(top : 0.0),
              child:               
              Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: inActiveRetrivedCryptoCurrency.length ,
                  itemBuilder: (BuildContext context , int index){
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          isSelectedInactive[index] == false ? isSelectedInactive[index] = true : isSelectedInactive[index] = false;
                        });
                      },
                        child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only( left : 15.0 , top: 10),
                            child: Row(
                  children: <Widget>[
                            Container(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: inActiveRetrivedCryptoCurrency[index] == "BTC" ? Color.fromRGBO(
                                                          247, 147, 26, 1) : inActiveRetrivedCryptoCurrency[index] == "BCH" ?Color.fromRGBO(
                                                              141, 195, 81, 1) : Colors.white,
                                      ),
                                      child: Image.asset(
                                        "assets/images/${inActiveRetrivedCryptoCurrency[index] }.png",
                                        fit: BoxFit.cover,
                                      )),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left :10.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("${inActiveRetrivedCryptoCurrency[index] ?? ""}",style: AppStyles.font20.copyWith(
                                                  fontWeight: FontWeight.w600)),
                                                  Text("${inActiveRetrivedCryptoCurrencyType[index]  ?? ""}",style: TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 18.0))
                                            ],
                                          ),
                                        ),
                                      )
                  ],
                ),
                          ),
                          Visibility(
                            visible: isSelectedInactive[index],
                            child: Container(
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pushNamed('statement',arguments: <String , String>{
                                        'currencyText' : inActiveRetrivedCryptoCurrency[index]
                                      });
                                    },
                                    child: Container(
                                      height: 80,
                                     color: Color.fromRGBO(0, 179, 223, 1),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              height: 40,
                                              child: Image.asset("assets/images/invoicewhite.png")),
                                            Text("Statement",style:AppStyles.font16.copyWith(color:Colors.white))
                                            
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        inActiveRetrivedCryptoCurrency.remove(inActiveRetrivedCryptoCurrency[index]);
                                      inActiveRetrivedCryptoCurrencyType.remove(inActiveRetrivedCryptoCurrencyType);
                                      addStringToSFInactive(inActiveRetrivedCryptoCurrency,inActiveRetrivedCryptoCurrencyType);
                                      });
                                    },
                                    child: Container(
                                      height: 80,
                                     color: Color.fromRGBO(225, 116, 119, 1),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              height: 40,
                                              child: Icon(Icons.delete_outline ,color:Colors.white)),
                                            Text("Delete",style:AppStyles.font16.copyWith(color:Colors.white))
                                            
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      //bottomsheet(context , retrivedCryptoCurrency[index] , retrivedCryptoCurrencytype[index]);
                                    },
                                    child: Container(
                                      height: 80,
                                     color: Color.fromRGBO(108, 202, 81, 1),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              height: 40,
                                              child: Icon(Icons.check ,color:Colors.white)),
                                            Text("Activate",style:AppStyles.font16.copyWith(color:Colors.white))
                                            
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            

           
          ],
        ),
      ),
    );
  }
   
  //Bottom sheet 
  void bottomsheet(BuildContext context , String accountname , String accounttype) {
    List<String> namelist = [];
    List<String> nametypelist = [];
  
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Container(
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
                    Text("Do you want to deactivate $accountname account?",
                        style: AppStyles.font22
                            .copyWith(fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Text(
                        "You may want to temporarily deactivate an account if you don't want to be bisible on the main screen or you want to prevent spending funds on this account when paying with your Fluency card.",
                        style: AppStyles.font16
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Container(
                        margin: EdgeInsets.all(16),
                        child: RaisedGradientButton(
                          child: Text(
                            "Deactivate Account",
                            style: AppStyles.buttonTextStyle,
                          ),
                          gradient: LinearGradient(
                            colors: [AppColors.c00B3DF, AppColors.c00B3DF],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          onPressed: () {
                            setState(() {
                              retrivedCryptoCurrency.remove(accountname);
                            retrivedCryptoCurrencytype.remove(accounttype);
                            addStringToSFActive(retrivedCryptoCurrency , retrivedCryptoCurrencytype); 
                            if (inActiveRetrivedCryptoCurrency?.isEmpty ?? true) {
                              namelist.add(accountname);
                              nametypelist.add(accounttype);
                              addStringToSFInactive(namelist, nametypelist);
                              setState(() {
                                Navigator.pop(context);
                              });
                            }
                            else
                            {   
                              inActiveRetrivedCryptoCurrency.add(accountname);
                              inActiveRetrivedCryptoCurrencyType.add(accounttype);
                              addStringToSFInactive(inActiveRetrivedCryptoCurrency, inActiveRetrivedCryptoCurrencyType);
                              Navigator.pop(context);
                            }
                            });
                                                       
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Center(child: Text("Close",style:AppStyles.font18.copyWith(color:AppColors.c00B3DF))),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
  
  }

