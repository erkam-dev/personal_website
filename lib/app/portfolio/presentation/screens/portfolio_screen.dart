import 'package:flutter/material.dart';

import '../../../../lib.dart';

class PortfolioScreen extends StatelessWidget {
  final String? iconPath;
  final String? title;
  final String? description;
  final String? appleRedirectionLink;
  final String? playRedirectionLink;
  final List<HighlightsItemWidget>? highlightItems;
  final List<String>? screenshotPathList;
  final List<Map<String, String>>? moreExplanations;
  final List<PortfolioItemWidget>? otherWorks;
  const PortfolioScreen({
    super.key,
    this.iconPath,
    this.title,
    this.description,
    this.appleRedirectionLink,
    this.playRedirectionLink,
    this.highlightItems,
    this.screenshotPathList,
    this.moreExplanations,
    this.otherWorks,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        children: [
          PortfolioHeroWidget(
            heroScreenshotPathList: screenshotPathList,
            iconPath: iconPath,
            title: title,
            description: description,
            appleRedirectionLink: appleRedirectionLink,
            playRedirectionLink: playRedirectionLink,
          ),
          const SizedBox(height: 64),
          const PortfolioHighlightsWidget(),
          const SizedBox(height: 64),
          PortfolioScreenshotsWidget(screenshotPaths: screenshotPathList),
          const SizedBox(height: 64),
          PortfolioMoreExplanationsWidget(contents: moreExplanations),
          const SizedBox(height: 64),
          SeeMoreWorkWidget(items: otherWorks),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}
