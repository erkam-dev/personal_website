import 'package:flutter/material.dart';
import 'package:personal_website/core/constants/layout_breakpoints.dart';

import '../../../../features/features.dart';
import '../../home.dart';

class HiScreen extends StatefulWidget {
  const HiScreen({super.key});

  @override
  State<HiScreen> createState() => _HiScreenState();
}

class _HiScreenState extends State<HiScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, c) => Center(
        child: SizedBox(
          width: c.biggest.width > desktopBp.toDouble()
              ? desktopBp.toDouble()
              : null,
          child: ListView(
            children: const [
              HelloHeroWidget(),
              FigmaDesignsSectionWidget(),
              SizedBox(height: 30),
              YoutubeVideosSectionWidget(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
