import 'package:flutter/material.dart';
import 'package:personal_website/core/core.dart';

extension LayoutExtension on Widget {
  LayoutBuilder maxDesktopWidth() => LayoutBuilder(
        builder: (p0, c) => Center(
          child: SizedBox(
            width: c.biggest.width > desktopBp ? desktopBp : c.biggest.width,
            child: this,
          ),
        ),
      );
}
