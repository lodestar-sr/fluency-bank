import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wealthpal/views/theme.dart';

class RaisedGradientButton extends StatelessWidget {

  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;
  final List<BoxShadow> shadows;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 40,
    this.onPressed,
    this.shadows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      disabledColor: AppColors.cBDBDBD,
      padding: EdgeInsets.all(0),
      child: Container(
        alignment: Alignment.center,
        child: child,
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
          boxShadow: shadows,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: onPressed,
    );
  }
}