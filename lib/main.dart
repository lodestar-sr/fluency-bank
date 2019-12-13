import 'package:fluencybank/views/dashboard/dashboard.dart';
import 'package:fluencybank/views/home.dart';
import 'package:flutter/material.dart';
import 'package:fluencybank/views/app.dart';
import 'package:shared_preferences/shared_preferences.dart';


Widget _defaultHome = Home();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get result of the login function.

  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return bool
  bool boolValue = prefs.getBool('CheckLogin');
  if (boolValue == true) {
    _defaultHome = Dashboard();
  }
  
  runApp(App(_defaultHome));
}