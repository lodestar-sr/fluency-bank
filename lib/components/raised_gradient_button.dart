import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {

  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;
  final List<BoxShadow> shadows;
  final double radius;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 40,
    this.onPressed,
    this.shadows,
    this.radius = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(),
      padding: EdgeInsets.all(0),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Container(
        alignment: Alignment.center,
        child: child,
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
          boxShadow: shadows,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        padding: EdgeInsets.all(0),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      onPressed: onPressed,
    );
  }
}