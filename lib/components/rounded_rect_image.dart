
import 'package:flutter/material.dart';

class RoundedRectImage extends StatelessWidget {

  final ImageProvider image;
  final double width;
  final double height;
  final double radius;

  const RoundedRectImage({
    Key key,
    this.image,
    this.width,
    this.height,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: image
        ),
      ),
    );
  }
}