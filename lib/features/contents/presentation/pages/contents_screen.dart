import 'package:flutter/material.dart';

import '../../../../app/app.dart';
import '../../contents.dart';

class ContentsScreen extends StatelessWidget {
  const ContentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayoutScheme(
      child: Column(
        children: [
          FigmaDesignsSectionWidget(),
          SizedBox(height: 30),
          YoutubeVideosSectionWidget(),
          SizedBox(height: 500),
        ],
      ),
    );
  }
}
