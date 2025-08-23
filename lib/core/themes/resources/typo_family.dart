import 'package:flutter/material.dart';

abstract class TypoFamily {
  const TypoFamily({
    required this.familyName,
    required this.bold,
    required this.semiBold,
    required this.regular,
  });

  final String familyName;
  final FontWeight bold;
  final FontWeight semiBold;
  final FontWeight regular;
}

class Pretendard implements TypoFamily {
  @override
  String get familyName => "Pretendard";

  @override
  FontWeight get bold => FontWeight.w800;

  @override
  FontWeight get semiBold => FontWeight.w600;

  @override
  FontWeight get regular => FontWeight.w400;
}
