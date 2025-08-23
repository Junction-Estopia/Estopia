import 'package:estopia/core/themes/entities/app_anim.dart';
import 'package:estopia/core/themes/entities/app_color.dart';
import 'package:estopia/core/themes/entities/app_typo.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  Brightness get brightness;
  AppColor get color;
  AppTypo get typo;
  AppAnim anim = AppAnim();
}
