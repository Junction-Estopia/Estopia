import 'package:flutter/material.dart';

extension Wrap on List<Widget> {
  List<Widget> wrap(Widget Function(Widget child) builder) {
    return map(builder).toList();
  }
}
