import 'package:flutter/material.dart';

extension TransformExtension on Widget {
  Transform flip({bool? y, bool? x}) =>
      Transform.flip(flipY: y ?? false, flipX: x ?? false, child: this);
  Transform rotate([double? angle]) =>
      Transform.rotate(angle: angle ?? 0, child: this);
  Transform scale([double? scale]) =>
      Transform.scale(scale: scale ?? 0, child: this);
}
