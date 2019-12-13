import 'package:fluencybank/views/theme.dart';
import 'package:flutter/material.dart';

class Privacy_Policy extends StatefulWidget {
  Privacy_Policy({Key key}) : super(key: key);

  @override
  _Privacy_PolicyState createState() => _Privacy_PolicyState();
}

class _Privacy_PolicyState extends State<Privacy_Policy> {

  List<String> policyquestions = ["Scope of policy","The information we hold about you","Marketing & cookies","Where we store your data","How long we keep it","Your rights","Changes to Privacy Policy"];
  @override
  Widget build(BuildContext context) {  
    return Container(
      color: Colors.white,
      child: SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                                padding: const EdgeInsets.only(left : 10.0),
                                child: Text("Privacy Policy",style: AppStyles.font24.copyWith(fontWeight: FontWeight.w600),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top : 20.0),
                                child: Container(
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: policyquestions.length,
                    separatorBuilder: (context, index) => Divider(
                    color: Colors.grey[400],
                  ),
                     itemBuilder: (BuildContext context, int index) {

                       return ListTile(
                         dense: true,
                         title: Text("${policyquestions[index]}",style:AppStyles.font20,textAlign: TextAlign.left,),
                         trailing: Icon(Icons.keyboard_arrow_right),
                         onTap: (){
                                 Navigator.of(context).pushNamed("Ans_Privacy_Policy",arguments: <String,String>{
                                   'privacyPolicyAns' : policyquestions[index]
                                 });
                         },
                       );
                     },
                  ),
                ),
                              ),
                            ],
                          )
                            )
                            )
                            )
                            )
                            );
                            }
                            )
                            )
                            ),
    );
  }
}