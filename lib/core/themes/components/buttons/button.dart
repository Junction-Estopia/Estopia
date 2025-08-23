import 'dart:math';

import 'package:estopia/core/themes/components/assets/icon_asset.dart';
import 'package:estopia/src/services/theme_service.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    this.icon,
    this.text,
    this.textStyle,
    this.textColor,
    this.width,
    this.height,
    this.decoration,
    this.padding,
    this.builder,
    this.disabled = false,
    required this.onTap,
  });

  final String? icon;
  final String? text;
  final TextStyle? textStyle;
  final Color? textColor;
  final double? width;
  final double? height;
  final Decoration? decoration;
  final EdgeInsets? padding;
  final bool disabled;
  final Widget Function(bool isPressed)? builder;
  final VoidCallback onTap;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isPressed = false;
  bool get isPressed => _isPressed;
  set isPressed(bool value) {
    setState(() {
      _isPressed = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        constraints: BoxConstraints(
          minHeight: min(widget.height ?? 48, 48),
          minWidth: min(widget.width ?? 48, 48),
        ),
        padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 16),
        decoration: widget.decoration,
        child:
            widget.builder?.call(widget.disabled ? true : isPressed) ??
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.text != null)
                  Text(
                    widget.text!,
                    style: (widget.textStyle ?? context.typo.headline4)
                        .copyWith(
                          color: widget.disabled
                              ? context.color.text4
                              : widget.textColor,
                        ),
                  ),

                if (widget.icon != null)
                  IconAsset(
                    widget.icon!,
                    color: context.color.text1,
                  ),
              ],
            ),
      ),
    );
  }
}
