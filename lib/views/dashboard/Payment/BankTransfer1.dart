import 'package:fluencybank/views/theme.dart';
import 'package:flutter/material.dart';

class BankTransfer1 extends StatefulWidget {
  BankTransfer1({Key key}) : super(key: key);

  @override
  _BankTransfer1State createState() => _BankTransfer1State();
}

class _BankTransfer1State extends State<BankTransfer1> {
  TextEditingController amountEntered = TextEditingController();

  @override
  void initState() { 
    super.initState();
    amountEntered.addListener(validator);
  }
  validator()
  {
    var amount = amountEntered.text;
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bank transfer",style: AppStyles.font20,),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top : 10.0),
                                child: Text("Recipient",style:AppStyles.font18.copyWith(color:Colors.grey[600],fontWeight:FontWeight.w500)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: 
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey[100]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Icon(Icons.account_balance,color: Colors.grey[700],),
                                          )
                                          ),
                                          Expanded(
                                                                                      child: Padding(
                                              padding: const EdgeInsets.only(left : 8.0),
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text("Helena Brauer : GBP",
                                                    style:AppStyles.font20.copyWith(fontWeight:FontWeight.w500)),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 5.0),
                                                      child: Text("Account number: 23242134",style:AppStyles.font18.copyWith(color:Colors.grey[600])),
                                                    ),
                                                    Text("Sort code: 23-54-65",style:AppStyles.font18.copyWith(color:Colors.grey[600])),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Icon(Icons.keyboard_arrow_down,color:Colors.grey[800])
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Text("How to send",style:AppStyles.font18.copyWith(color:Colors.grey[600],fontWeight:FontWeight.w500)),
                              ),

                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: 
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey[100]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Image.asset("assets/images/eng.png"),
                                          )
                                          ),
                                          Expanded(
                                                                                      child: Padding(
                                              padding: const EdgeInsets.only(left : 8.0),
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text("GBP",
                                                    style:AppStyles.font20.copyWith(fontWeight:FontWeight.w500)),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 5.0),
                                                      child: Text("£1,000.00",style:AppStyles.font18.copyWith(color:Colors.grey[600])),
                                                    ),
                                                    
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Icon(Icons.keyboard_arrow_down,color:Colors.grey[800])
                                      ],
                                    ),
                                  ),
                                ),
                              ),


 
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