import 'package:flutter/material.dart';

extension Gap on List<Widget> {
  List<Widget> gap(double spacing) {
    final children = <Widget>[];
    for (int i = 0; i < length; i++) {
      children.add(this[i]);
      if (i != length - 1) {
        children.add(SizedBox.square(dimension: spacing));
      }
    }
    return children;
  }
}
