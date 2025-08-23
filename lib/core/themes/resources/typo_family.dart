import 'package:flutter/material.dart';

abstract class TypoFamily {
  const TypoFamily({
    required this.familyName,
    required this.bold,
    required this.regular,
  });

  final String familyName;
  final FontWeight bold;
  final FontWeight regular;
}

class KoddiUDOnGothic implements TypoFamily {
  @override
  String get familyName => "KoddiUDOnGothic";

  @override
  FontWeight get bold => FontWeight.w700;

  @override
  FontWeight get regular => FontWeight.w400;
}
