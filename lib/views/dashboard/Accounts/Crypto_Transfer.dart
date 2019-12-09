import 'package:fluencybank/views/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';


class Crypto_Transfer extends StatefulWidget {
  Crypto_Transfer({Key key}) : super(key: key);

  @override
  _Crypto_TransferState createState() => _Crypto_TransferState();
}

class _Crypto_TransferState extends State<Crypto_Transfer> {
  bool isCompany = false;
  String barcode = "Wallet address";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Crypto Transfer",style: AppStyles.font18,),
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
                      child: IntrinsicHeight(
                          child: Container(
                              color: Colors.white,
                              width: double.infinity,
                              child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Recipient",style: AppStyles.font18.copyWith(color: Colors.grey[500]),),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.grey[200],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(bottom: BorderSide(color: Colors.grey[500]))
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(top : 15.0,bottom: 8),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: <Widget>[
                                                          Expanded(child: Text("$barcode",style:AppStyles.font18.copyWith(color:Colors.grey[500]))),
                                                          GestureDetector(
                                                              onTap: (){
                                                                setState(() {
                                                                  scan();
                                                                  //TODO:- ADD permission for camera in ios
                                                                });
                                                              },                                                        child: Container(
                                                              height: 30,
                                                              width: 30,
                                                              child: Image.asset("assets/images/crypto-scan.png"),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top : 15.0),
                                                    child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: <Widget>[
                                                          Expanded(child: Text("Is this a company?",style:AppStyles.font18.copyWith(color:Colors.grey[500]))),
                                                          Container(
                                                            height: 30,
                                                            width: 30,
                                                            child: CupertinoSwitch(
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
                                                          )
                                                        ],
                                                      ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ]
                                      )
                                      )
                                      )
                                      )
                                      )
                                      )
                                      );
                                      }
                                      )
                                      );
  }

  //Barcode Scan
    Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
