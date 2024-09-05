// ignore_for_file: deprecated_member_use

import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/utils/pages/page_const.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final bool visible;
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final VoidCallback? onPressed;
  final Color color;
  final Alignment alignment;
  final Widget? child;

  const DefaultButton({
    Key? key,
    this.visible = true,
    this.width = 96,
    this.height = 32,
    this.margin,
    this.padding,
    this.decoration,
    this.onPressed,
    this.color = COLOR_00528C,
    this.alignment = Alignment.center,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: decoration,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: PAGE_ELEVATION,
            backgroundColor: color,
            side: BORDER_SIDE,
            alignment: alignment,
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
