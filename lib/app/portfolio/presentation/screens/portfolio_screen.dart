import 'package:flutter/material.dart';
import 'package:personal_website/app/portfolio/presentation/widgets/widgets.dart';
import 'package:personal_website/core/extensions/layout_extension.dart';

import '../../../../lib.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        children: const [
          PortfolioHeroWidget(),
          PortfolioHighlightsWidget(),
          PortfolioScreenshotsWidget(),
          PortfolioMoreExplanationsWidget(),
          SeeMoreWorkWidget(),
        ],
      ).maxDesktopWidth(),
    );
  }
}
