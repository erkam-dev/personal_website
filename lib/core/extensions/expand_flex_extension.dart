import 'package:flutter/material.dart';

extension ExpandExtension on Widget {
  Row expandWidth() => Row(children: [Expanded(child: this)]);
  Expanded expanded() => Expanded(child: this);
  Flexible flexible() => Flexible(child: this);
}
