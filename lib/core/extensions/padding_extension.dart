import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Padding pad(
    double value, {
    bool horizontal = true,
    bool vertical = true,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal ? value : 0,
          vertical: vertical ? value : 0,
        ),
        child: this,
      );
  Padding padOnly({double? top, double? bottom, double? right, double? left}) =>
      Padding(
          padding: EdgeInsets.only(
            top: top ?? 0,
            bottom: bottom ?? 0,
            right: right ?? 0,
            left: left ?? 0,
          ),
          child: this);
  Padding pad4({bool horizontal = true, bool vertical = true}) =>
      pad(4, horizontal: horizontal, vertical: vertical);
  Padding pad8({bool horizontal = true, bool vertical = true}) =>
      pad(8, horizontal: horizontal, vertical: vertical);
  Padding pad16({bool horizontal = true, bool vertical = true}) =>
      pad(16, horizontal: horizontal, vertical: vertical);
  Padding pad24({bool horizontal = true, bool vertical = true}) =>
      pad(24, horizontal: horizontal, vertical: vertical);
  Padding pad32({bool horizontal = true, bool vertical = true}) =>
      pad(32, horizontal: horizontal, vertical: vertical);
  SafeArea safeArea({
    bool? top,
    bool? bottom,
    bool? right,
    bool? left,
    bool? maintainBottomViewPadding,
  }) =>
      SafeArea(
        top: top ?? true,
        bottom: bottom ?? true,
        right: right ?? true,
        left: left ?? true,
        maintainBottomViewPadding: maintainBottomViewPadding ?? false,
        child: this,
      );
}

extension EdgeInsetsExtension on BuildContext {
  EdgeInsets edgeInsets(double value,
          {bool horizontal = true, bool vertical = true}) =>
      EdgeInsets.symmetric(
          horizontal: horizontal ? value : 0, vertical: vertical ? value : 0);
  EdgeInsets edgeInsetsOnly(
          {double? top, double? bottom, double? right, double? left}) =>
      EdgeInsets.only(
        top: top ?? 0,
        bottom: bottom ?? 0,
        right: right ?? 0,
        left: left ?? 0,
      );
  EdgeInsets edgeInsets4({bool horizontal = true, bool vertical = true}) =>
      edgeInsets(4, horizontal: horizontal, vertical: vertical);
  EdgeInsets edgeInsets8({bool horizontal = true, bool vertical = true}) =>
      edgeInsets(8, horizontal: horizontal, vertical: vertical);
  EdgeInsets edgeInsets16({bool horizontal = true, bool vertical = true}) =>
      edgeInsets(16, horizontal: horizontal, vertical: vertical);
  EdgeInsets edgeInsets24({bool horizontal = true, bool vertical = true}) =>
      edgeInsets(24, horizontal: horizontal, vertical: vertical);
  EdgeInsets edgeInsets32({bool horizontal = true, bool vertical = true}) =>
      edgeInsets(32, horizontal: horizontal, vertical: vertical);
}
