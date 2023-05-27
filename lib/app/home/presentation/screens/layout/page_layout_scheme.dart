import 'package:flutter/material.dart';
import 'package:personal_website/core/constants/layout_breakpoints.dart';

class PageLayoutScheme extends StatelessWidget {
  final Widget child;
  const PageLayoutScheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, c) => SingleChildScrollView(
        child: Center(
          child: SizedBox(
              width: c.biggest.width > desktopBp.toDouble()
                  ? desktopBp.toDouble()
                  : null,
              child: child),
        ),
      ),
    );
  }
}
