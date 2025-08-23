import 'package:estopia/core/base/base_service.dart';
import 'package:estopia/core/themes/entities/app_anim.dart';
import 'package:estopia/core/themes/entities/app_color.dart';
import 'package:estopia/core/themes/entities/app_theme.dart';
import 'package:estopia/core/themes/entities/app_typo.dart';
import 'package:estopia/core/themes/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ThemeService extends BaseService<AppTheme> {
  ThemeService() : super(LightTheme());
}

extension ThemeServiceExtension on BuildContext {
  AppTheme get theme => watch<ThemeService>().state;
  AppColor get color => theme.color;
  AppTypo get typo => theme.typo;
  AppAnim get anim => theme.anim;

  ThemeData get themeData => ThemeData(
    scaffoldBackgroundColor: color.surface,
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: typo.headline1,
      backgroundColor: color.surface,
      iconTheme: IconThemeData(color: color.text1),
    ),
    textTheme: TextTheme(
      bodyMedium: typo.body1,
    ),
    dividerTheme: DividerThemeData(
      thickness: 1,
      space: 0,
    ),
  );
}
