import 'package:flutter/material.dart';

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
}
