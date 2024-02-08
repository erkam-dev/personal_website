import 'package:flutter/material.dart';
import 'package:personal_website/lib.dart';

extension ContainerExtension on Widget {
  SizedBox sizedBox({double? height, double? width}) =>
      SizedBox(height: height, width: width, child: this);
  SizedBox squareBox([double? dimension]) =>
      SizedBox.square(dimension: dimension, child: this);
  ConstrainedBox constrainedBox(BoxConstraints boxConstraints) =>
      ConstrainedBox(constraints: boxConstraints, child: this);
  Visibility visibility([bool? visible]) =>
      Visibility(visible: visible ?? true, child: this);
  Offstage offstage([bool? offstage]) =>
      Offstage(offstage: offstage ?? true, child: this);
  IgnorePointer ignorePointer([bool? ignoring]) =>
      IgnorePointer(ignoring: ignoring ?? true, child: this);
  AspectRatio aspectRatio(double aspectRatio) =>
      AspectRatio(aspectRatio: aspectRatio, child: this);
  Card card({
    Key? key,
    Color? color,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    ShapeBorder? shape,
    bool borderOnForeground = true,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    bool semanticContainer = true,
  }) =>
      Card(
        key: key,
        color: color,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        elevation: elevation,
        shape: shape,
        borderOnForeground: borderOnForeground,
        margin: margin,
        clipBehavior: clipBehavior,
        semanticContainer: semanticContainer,
        child: this,
      );
  Card customCard({
    BorderRadius? borderRadius,
    double? blur,
    Key? key,
    Color? color,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    bool borderOnForeground = true,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    bool semanticContainer = true,
  }) =>
      Card(
        key: key,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
            side: const BorderSide(width: 1, color: Color(0xFFE6E0EC))),
        color: color ?? Colors.white38,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        elevation: elevation,
        borderOnForeground: borderOnForeground,
        margin: margin,
        clipBehavior: clipBehavior,
        semanticContainer: semanticContainer,
        child: blurBackgroundWithClip(blur: blur),
      );
}
