import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import '../../theme.dart';


class MoreHomescreen extends StatefulWidget {
  MoreHomescreen({Key key}) : super(key: key);

  @override
  _MoreHomescreenState createState() => _MoreHomescreenState();
}

class _MoreHomescreenState extends State<MoreHomescreen> {

  List<String> heading = ["Personal details","Account configuration","Login and Security","Notifications"];
  List<String> subheading = ["Name,phone number,email,home address","Main currency,account settings,statement","Passcode,Face ID,Fingerprint","Manage your app notifications"];
  List<String> settings = ["Rate Us on the App Store","FAQ","Privacy Policy","Terms & Conditions","Logout"];
  var icons = [LineAwesomeIcons.thumbs_up,LineAwesomeIcons.headphones,LineAwesomeIcons.file_text,Icons.info_outline,Icons.power_settings_new];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 179, 223, 1),
      child: SafeArea(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
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
                color: Color.fromRGBO(0, 179, 223, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 21.0),
                      child: Text("More",
                          style: AppStyles.font36.copyWith(
                              fontSize: 45,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)
                              ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
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
                      
                      title: Text("${heading[index]}",style:AppStyles.font18.copyWith(fontWeight: FontWeight.w500)),
                      subtitle: Text("${subheading[index]}",style:AppStyles.font16.copyWith(color:Colors.grey[500])),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: (){
                        if (index == 0) 
                        {                         
                         Navigator.of(context).pushNamed('PersonalDetails');                       
                        }
                        if (index == 1) 
                        {                         
                         Navigator.of(context).pushNamed('AccountConfiguration');                       
                        }
                        if (index == 2) 
                        {                         
                         Navigator.of(context).pushNamed('PersonalDetails');                       
                        }
                        if (index == 3) 
                        {                         
                         Navigator.of(context).pushNamed('PersonalDetails');                       
                        }
                        
                      },
                    );
                  },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                  border: Border(
                                  top: BorderSide(color: Colors.grey[400], width: 0.3),
                                  )
                                  ),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: settings.length,
                                    itemBuilder: (BuildContext context , int index) =>ListTile(
                                      dense: true,
                                      leading: Icon(icons[index],color:Colors.black,size:28),
                                      title: Text("${settings[index]}",style: AppStyles.font18.copyWith(fontSize: 18.0,fontWeight: FontWeight.w600),),
                                    ),
                                  ),
                                ),
                              )
                            ],

                          ),
                          )
                          )
                          ),

                  ]
                  )
                  )
                  )
                  )
                  );
                  }
                  )
                  )
                  );
  }
}