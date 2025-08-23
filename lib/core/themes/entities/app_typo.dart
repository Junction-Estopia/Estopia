import 'package:estopia/core/themes/resources/typo_family.dart';
import 'package:flutter/material.dart';

abstract class AppTypo {
  Color get color;
  TypoFamily get typoFamily;
  FontWeight get regular => typoFamily.regular;
  FontWeight get semiBold => typoFamily.semiBold;

  TextStyle get headline1;
  TextStyle get headline2;
  TextStyle get headline3;
  TextStyle get headline4;
  TextStyle get headline5;
  TextStyle get headline6;
  TextStyle get subtitle1;
  TextStyle get subtitle2;
  TextStyle get body1;
  TextStyle get body2;
}

class DefaultTypo implements AppTypo {
  DefaultTypo({required this.color});

  /// Font Color
  @override
  final Color color;

  @override
  final TypoFamily typoFamily = Pretendard();

  /// Font Weight
  @override
  late FontWeight regular = typoFamily.regular;

  @override
  late FontWeight semiBold = typoFamily.semiBold;

  /// Headline
  @override
  late final TextStyle headline1 = TextStyle(
    height: 1.3,
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.regular,
    fontSize: 28,
    color: color,
  );
  @override
  late final TextStyle headline2 = TextStyle(
    height: 1.3,
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.regular,
    fontSize: 24,
    color: color,
  );
  @override
  late final TextStyle headline3 = TextStyle(
    height: 1.3,
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.regular,
    fontSize: 21,
    color: color,
  );
  @override
  late final TextStyle headline4 = TextStyle(
    height: 1.3,
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.regular,
    fontSize: 20,
    color: color,
  );
  @override
  late final TextStyle headline5 = TextStyle(
    height: 1.3,
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.regular,
    fontSize: 19,
    color: color,
  );
  @override
  late final TextStyle headline6 = TextStyle(
    height: 1.3,
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.regular,
    fontSize: 18,
    color: color,
  );

  /// Subtitle
  @override
  late final TextStyle subtitle1 = TextStyle(
    height: 1.3,
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.regular,
    fontSize: 16,
    color: color,
  );
  @override
  late final TextStyle subtitle2 = TextStyle(
    height: 1.3,
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.regular,
    fontSize: 15,
    color: color,
  );

  /// Body
  @override
  late final TextStyle body1 = TextStyle(
    height: 1.3,
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.regular,
    fontSize: 14,
    color: color,
  );
  @override
  late final TextStyle body2 = TextStyle(
    height: 1.3,
    fontFamily: typoFamily.familyName,
    fontWeight: typoFamily.regular,
    fontSize: 12,
    color: color,
  );
}
