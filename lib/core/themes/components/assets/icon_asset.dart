import 'package:flutter/material.dart';

class IconAsset extends StatelessWidget {
  const IconAsset(
    this.name, {
    super.key,
    this.size,
    this.color,
  });
  final String name;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icons/$name",
      width: size,
      height: size,
      color: color,
    );
  }
}
