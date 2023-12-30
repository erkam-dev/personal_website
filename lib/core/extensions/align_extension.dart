import 'package:flutter/material.dart';

extension AlignExtension on Widget {
  Center centerWidget() => Center(child: this);
  Align centerRight() => Align(alignment: Alignment.centerRight, child: this);
  Align centerLeft() => Align(alignment: Alignment.centerLeft, child: this);
  Align topLeft() => Align(alignment: Alignment.topLeft, child: this);
  Align bottomLeft() => Align(alignment: Alignment.bottomLeft, child: this);
  Align topRight() => Align(alignment: Alignment.topRight, child: this);
  Align bottomRight() => Align(alignment: Alignment.bottomRight, child: this);
  Align topCenter() => Align(alignment: Alignment.topCenter, child: this);
  Align bottomCenter() => Align(alignment: Alignment.bottomCenter, child: this);
}
