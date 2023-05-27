import 'package:flutter/material.dart';

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
    return PageLayoutScheme(
      child: Column(
        children: [
          HelloHeroWidget(),
          FigmaDesignsSectionWidget(),
          SizedBox(height: 30),
          YoutubeVideosSectionWidget(),
          SizedBox(height: 500),
        ],
      ),
    );
  }
}
