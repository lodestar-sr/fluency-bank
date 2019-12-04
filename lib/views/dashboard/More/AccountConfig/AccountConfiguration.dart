import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluencybank/views/theme.dart';

class AccountConfiguration extends StatefulWidget {
  AccountConfiguration({Key key}) : super(key: key);

  @override
  _AccountConfigurationState createState() => _AccountConfigurationState();
}

class _AccountConfigurationState extends State<AccountConfiguration> {
  var daysSelected = "7 days";
  List<String> heading = ["Main Currency","Action period","Account management"];
  List<String> subheading ;
  @override
  Widget build(BuildContext context) {
    subheading = ["Gbp","Income and expense amounts for every ${daysSelected}","Create,deactivate,move accounts"];
    return Container(
      color: Colors.white,
      child: SafeArea(
            child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) =>
          Scaffold(
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
                      Text("Account configuration",
                                    style: AppStyles.font24
                                        .copyWith(fontWeight: FontWeight.bold)
                        ),
                         Padding(
                                padding: const EdgeInsets.only(top : 8.0),
                                child: Container(
                                  child: ListView.separated(
                                    physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: heading.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey[400],
                  ),
                  itemBuilder: (BuildContext context , int index)
                  {
                    return ListTile(
                      dense: true,
                      
                      title: Text("${heading[index] ?? ""}",style:AppStyles.font18.copyWith(fontWeight: FontWeight.w500)),
                      subtitle: Text("${subheading[index] ?? ""}",style:AppStyles.font16.copyWith(color:Colors.grey[500])),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: (){
                        if (index == 0) 
                        {                         
                         Navigator.of(context).pushNamed('ChoosemainCurrency');                       
                        }
                        if (index == 1) 
                        {                         
                         _settingbottomsheet(context);                       
                        }
                        if (index == 2) 
                        {                         
                         Navigator.of(context).pushNamed('AccountManagement');                       
                        }
                        
                      },
                    );
                  },
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                  top: BorderSide(color: Colors.grey[400], width: 0.3),
                                  )
                                  ),
                              )
                    ]
                    )
                    )
                    )
                    )
                    )
                    ),
          ),
      ),
    )
    );
  }

  void _settingbottomsheet(BuildContext context) {
    var selected;
    showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.grey[100],
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,                   
                    children: <Widget>[
                      Text("Action period",style: AppStyles.font18.copyWith(fontWeight: FontWeight.w600),),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          setState(() {
                            daysSelected = selected;
                          });
                        
                        },
                        child: Text("Done",
                            style: TextStyle(
                                fontSize: 18.0,fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(0, 122, 255, 1))),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100.0,
                    child: CupertinoPicker(
                      backgroundColor: Colors.white,
                      children: <Widget>[
                        Text("1 Day"),
                        Text("7 days"),
                        Text(" 2 weeks"),
                        Text("1 month")
                      ],
                      itemExtent: 50,
                      onSelectedItemChanged: (int index) {
                        print(index);
                        if (index == 0) {
                          selected = "1 Day";
                        } else if (index == 1) {
                          selected = "7 days";
                        }
                        else if (index == 2) {
                          selected = "2 weeks";
                        }
                        else if (index == 3) {
                          selected = "1 month";
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}