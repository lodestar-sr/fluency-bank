
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {

  final ImageProvider image;
  final double width;
  final double height;

  const CircularImage({
    Key key,
    this.image,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: image
        ),
      ),
    );
  }
}