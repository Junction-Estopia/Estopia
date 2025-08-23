import 'package:estopia/core/themes/resources/typo_family.dart';
import 'package:flutter/material.dart';

abstract class AppTypo {
  /// Color
  Color get color;

  /// TypoFamily
  TypoFamily get typoFamily;

  /// Head
  TextStyle get headBold;

  /// Body1
  TextStyle get body1Bold;
  TextStyle get body1Regular;

  /// Body2
  TextStyle get body2Bold;
  TextStyle get body2Bold2;
  TextStyle get body2Regular;

  /// Button
  TextStyle get buttonBold;
  TextStyle get buttonBold2;

  /// Caption1
  TextStyle get caption1Regular;

  /// Caption2
  TextStyle get caption2Regular;
}

class DefaultTypo implements AppTypo {
  DefaultTypo({required this.color});

  @override
  final Color color;

  @override
  final TypoFamily typoFamily = KoddiUDOnGothic();

  @override
  late final TextStyle headBold = TextStyle(
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.bold,
    fontSize: 32,
    height: 1.4,
    color: color,
  );

  @override
  late final TextStyle body1Bold = TextStyle(
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.bold,
    fontSize: 24,
    height: 1.4,
    color: color,
  );

  @override
  late final TextStyle body1Regular = TextStyle(
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.regular,
    fontSize: 18,
    height: 1.4,
    color: color,
  );

  @override
  late final TextStyle body2Bold = TextStyle(
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.bold,
    fontSize: 16,
    height: 1.4,
    color: color,
  );

  @override
  late final TextStyle body2Bold2 = TextStyle(
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.bold,
    fontSize: 17,
    height: 1.4,
    color: color,
  );

  @override
  late final TextStyle body2Regular = TextStyle(
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.regular,
    fontSize: 12,
    height: 1.4,
    color: color,
  );

  @override
  late final TextStyle buttonBold = TextStyle(
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.bold,
    fontSize: 24,
    height: 1.4,
    color: color,
  );

  @override
  late final TextStyle buttonBold2 = TextStyle(
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.bold,
    fontSize: 18,
    height: 1.4,
    color: color,
  );

  @override
  late final TextStyle caption1Regular = TextStyle(
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.regular,
    fontSize: 16,
    height: 1.4,
    color: color,
  );

  @override
  late final TextStyle caption2Regular = TextStyle(
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.regular,
    fontSize: 22,
    height: 1.4,
    color: color,
  );
}
