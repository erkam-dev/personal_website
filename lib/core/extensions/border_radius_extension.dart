import 'package:flutter/material.dart';

extension RoundBorderExtension on Widget {
  ClipRRect roundBorder([double radius = 8.0]) =>
      ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);
  ClipRRect roundBorder4() => roundBorder(4);
  ClipRRect roundBorder8() => roundBorder(8);
  ClipRRect roundBorder16() => roundBorder(16);
  ClipRRect roundBorder24() => roundBorder(24);
  ClipRRect roundBorder32() => roundBorder(32);
}

extension BorderRadiusExtension on BuildContext {
  BorderRadius borderRadius([double radius = 8.0]) =>
      BorderRadius.circular(radius);
  BorderRadius borderRadius4() => borderRadius(4);
  BorderRadius borderRadius8() => borderRadius(8);
  BorderRadius borderRadius16() => borderRadius(16);
  BorderRadius borderRadius24() => borderRadius(24);
  BorderRadius borderRadius32() => borderRadius(32);
}
