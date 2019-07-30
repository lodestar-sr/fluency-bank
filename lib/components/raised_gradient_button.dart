import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wealthpal/views/theme.dart';

class RaisedGradientButton extends StatelessWidget {

  final Widget child;
  final Gradient gradient;
  final double width;
  final Function onPressed;
  final EdgeInsets margin;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.onPressed,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: RaisedButton(
        disabledColor: AppColors.underlineColor,
        padding: EdgeInsets.all(0),
        child: Container(
          alignment: Alignment.center,
          child: child,
          width: width,
          decoration: BoxDecoration(
            gradient: gradient,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(64, 145, 0, 247),
                offset: Offset(0, 4),
                blurRadius: 10,
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: onPressed,
      ),
    );
  }
}