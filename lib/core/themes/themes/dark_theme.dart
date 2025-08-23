import 'dart:ui';

import 'package:estopia/core/themes/entities/app_color.dart';
import 'package:estopia/core/themes/entities/app_theme.dart';
import 'package:estopia/core/themes/entities/app_typo.dart';
import 'package:estopia/core/themes/resources/palette.dart';

final class DarkTheme extends AppTheme {
  @override
  final Brightness brightness = Brightness.dark;

  @override
  final AppColor color = AppColor(
    surface: Palette.grey900,
    background: Palette.black.withValues(alpha: 0.2),
    onBackground: Palette.white,
    text1: Palette.white,
    text2: Palette.grey200,
    text3: Palette.grey300,
    text4: Palette.grey700,
    border: Palette.grey400,
    accent: Palette.yellow,
    onAccent: Palette.grey900,
  );

  @override
  final AppTypo typo = DefaultTypo(color: Palette.white);
}
