import 'dart:ui';

import 'package:estopia/core/themes/entities/app_color.dart';
import 'package:estopia/core/themes/entities/app_theme.dart';
import 'package:estopia/core/themes/entities/app_typo.dart';
import 'package:estopia/core/themes/resources/palette.dart';

final class LightTheme extends AppTheme {
  @override
  final Brightness brightness = Brightness.light;

  @override
  final AppColor color = AppColor(
    surface: Palette.white,
    background: Palette.black.withValues(alpha: 0.2),
    onBackground: Palette.white,
    text1: Palette.grey900,
    text2: Palette.grey700,
    text3: Palette.grey500,
    text4: Palette.grey300,
    border: Palette.grey300,
    accent: Palette.blue,
    onAccent: Palette.white,
  );

  @override
  late final AppTypo typo = DefaultTypo(color: color.text1);
}
