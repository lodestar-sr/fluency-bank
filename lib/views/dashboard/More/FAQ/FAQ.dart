import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/components/verification_code_input.dart';
import 'package:fluencybank/views/dashboard/More/FAQ/AllQuestions.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  FAQ({Key key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: LayoutBuilder(
                builder: (BuildContext context,
                        BoxConstraints viewportConstraints) =>
                    DefaultTabController(
                      length: 4,
                      child: Scaffold(
                          appBar: new PreferredSize(
                            preferredSize: Size.fromHeight(245),
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.arrow_back,
                                        size: 30,
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text("FAQ",
                                          style: AppStyles.font28.copyWith(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Container(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: "Search",
                                            hintStyle: AppStyles.font16
                                                .copyWith(
                                                    color: Colors.grey[600]),
                                            prefixIcon: Icon(Icons.search),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.grey[200],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30.0),
                                      child: TabBar(
                                        isScrollable: true,
                                        labelStyle: AppStyles.font16.copyWith(fontWeight: FontWeight.w500),
                                        labelColor: Colors.black,
                                        indicatorColor: Colors.black,
                                        tabs: <Widget>[
                                          Text(
                                            "All Questions",
                                            
                                          ),
                                          Text("Payments"),
                                          Text("Transaction Issues"),
                                          Text("Card Issues"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          body: TabBarView(
                            children: <Widget>[
                              AllQuestions(),
                              Icon(Icons.keyboard_backspace),
                              Icon(Icons.keyboard_tab),
                              Icon(Icons.keyboard_return)
                            ],
                          )),
                    ))));
  }
}
