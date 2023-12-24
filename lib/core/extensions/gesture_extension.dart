import 'package:flutter/material.dart';

extension GestureExtension on Widget {
  InkWell inkwell(
    Function()? onTap, {
    Function(TapDownDetails details)? onTapDown,
    Function(TapUpDetails details)? onTapUp,
    Function()? onTapCancel,
  }) =>
      InkWell(
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTapCancel: onTapCancel,
        onTap: onTap,
        child: this,
      );
  GestureDetector gestureDetector(
    Function()? onTap, {
    Function(TapDownDetails details)? onTapDown,
    Function(TapUpDetails details)? onTapUp,
    Function()? onTapCancel,
  }) =>
      GestureDetector(
        onTap: onTap,
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTapCancel: onTapCancel,
        child: this,
      );
}
