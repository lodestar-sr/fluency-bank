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
                        // if (index == 0) 
                        // {                         
                        //  Navigator.of(context).pushNamed('PersonalDetails');                       
                        // }
                        // if (index == 1) 
                        // {                         
                        //  Navigator.of(context).pushNamed('AccountConfiguration');                       
                        // }
                        // if (index == 2) 
                        // {                         
                        //  Navigator.of(context).pushNamed('PersonalDetails');                       
                        // }
                        
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
}