import 'package:flutter/material.dart';

import '../../../../features/features.dart';
import '../../home.dart';

class HiScreen extends StatelessWidget {
  const HiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayoutScheme(
      child: Column(
        children: [
          HelloHeroWidget(),
          FigmaDesignsSectionWidget(),
          SizedBox(height: 30),
          YoutubeVideosSectionWidget(),
          SizedBox(height: 30),
          GithubReposSectionWidget(),
          SizedBox(height: 300),
        ],
      ),
    );
  }
}
