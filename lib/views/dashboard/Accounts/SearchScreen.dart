import 'package:fluencybank/views/theme.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool check = false;


  @override
  void initState() { 
    super.initState();
   // searchController.addListener(validator());
  }
  validator()
  {
     var search = searchController.text;
     print(search);
     if (search.isEmpty) {
       setState(() {
         check = true;
       });
     } else {
       setState(() {
         check = false;
       });
     }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top :2.0),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
                      child: Container(
    
                                            child: TextFormField(
                                              onChanged: (value) =>validator(),
                                              onEditingComplete: validator(),                                           
                                              controller: searchController,
                                              
                                              autofocus: true,
                                              decoration: InputDecoration(
                                                
                                                hintText: "Search",
                                                hintStyle: AppStyles.font16
                                                    .copyWith(
                                                        color: Colors.grey[600]),
                                                prefixIcon: Icon(Icons.search),
                                                suffixIcon: IconButton(
                                                  icon: Icon(Icons.cancel),
                                                  onPressed: (){
                                                    setState(() {
                                                      searchController.text = "";
                                                    });
                                                  },
                                                ),
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
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
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
                          child: Visibility(
                            visible: check,
                                                      child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                               Text("Search payments,bills,contacts,FAQ,etc.",style:AppStyles.font24.copyWith(fontWeight:FontWeight.w600))
                              ]
                              ),
                              replacement: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset("assets/images/noresult.png"),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text("No results found.",style:AppStyles.font24.copyWith(fontWeight:FontWeight.w600)),
                                  )
                                ],
                              ),
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
}