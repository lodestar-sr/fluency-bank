import 'package:flutter/material.dart';


class MoreHomescreen extends StatefulWidget {
  MoreHomescreen({Key key}) : super(key: key);

  @override
  _MoreHomescreenState createState() => _MoreHomescreenState();
}

class _MoreHomescreenState extends State<MoreHomescreen> {

  int currentTab = 1;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MoreHomescreen();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("screen4"),
    );
  }
}