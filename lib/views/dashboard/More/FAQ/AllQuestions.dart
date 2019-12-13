import 'package:fluencybank/views/theme.dart';
import 'package:flutter/material.dart';

class AllQuestions extends StatefulWidget {
  AllQuestions({Key key}) : super(key: key);

  @override
  _AllQuestionsState createState() => _AllQuestionsState();
}

class _AllQuestionsState extends State<AllQuestions> {
  List<String> allQuestions = ["Does the conversion from and to cryptocurrenciews happen instantly?","Are my cryptocurrencies secure?","Will I be charged for cryptocurrency withdrawals?","How do I convert fiat currencies to cryptocurrencies?","Where can I transfer fiat money?","How do I transfer fiat money to my Fluency account?"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: allQuestions.length,
                    separatorBuilder: (context, index) => Divider(
                    color: Colors.grey[400],
                  ),
                     itemBuilder: (BuildContext context, int index) {

                       return ListTile(
                         dense: true,
                         title: Text("${allQuestions[index]}",style:AppStyles.font20),
                         trailing: Icon(Icons.keyboard_arrow_right),
                         onTap: (){
                           Navigator.of(context).pushNamed("FaqAnswers",arguments: <String,String>{
                             'question' : allQuestions[index],
                           });
                         },
                       );
                     },
                  ),
                ))));
  }
}
