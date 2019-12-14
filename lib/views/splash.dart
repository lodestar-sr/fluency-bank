import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluencybank/views/theme.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Timer _timer;
  String _defaultHome = 'home';
  _SplashState() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      timer.cancel();
      Navigator.of(context).pushNamed('$_defaultHome');
    });
  }
  Future checkLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return bool
  bool boolValue = prefs.getBool('CheckLogin');
  if (boolValue == true) {
    setState(() {
      _defaultHome = 'dashboard';
    });
  }
  } 
  @override
  void initState() { 
    super.initState();
    checkLogin();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: false,
        color: AppColors.c00B3DF,
        progressIndicator: CircularProgressIndicator(),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Stack(children: [
                      Center(
                        child: Image.asset(
                          "assets/images/bg1.png",
                          width: size.width,
                          height:size.height,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 128),
                              child: Image.asset("assets/images/logo_title.png",
                                  width: 208, height: 48),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
