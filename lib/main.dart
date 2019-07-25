import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking Unicorn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Banking Unicorn'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const platform = const MethodChannel('flutter.native/helper');
  String _responseFromNativeCode = 'Waiting for Response...';

  Future<void> startFlutterKYC() async {

    String response = "";
    try {
      final String result = await platform.invokeMethod('startKYC');
      response = result;
    } on PlatformException catch(e) {
      response = "Failed to invoke: '${e.message}'.";
    }

    setState(() {
      _responseFromNativeCode = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please verify your identity',
              style: TextStyle(fontSize: 22),
            ),
            Text(_responseFromNativeCode)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: startFlutterKYC,
        tooltip: 'KYC',
        child: Icon(Icons.photo_camera),
      ),
    );
  }
}
