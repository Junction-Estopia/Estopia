import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  const ImageAsset(
    this.name, {
    super.key,
    this.width,
    this.height,
  });
  final String name;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/$name",
      width: width,
      height: height,
    );
  }
}
