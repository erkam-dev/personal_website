import 'package:flutter/material.dart';

import '../../../../lib.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Container(
          //   height: 400,
          //   width: 700,
          //   color: Colors.blue,
          // ),
          // Container(
          //   height: 700,
          //   width: 400,
          //   color: Colors.orange,
          // ),
          ListView(
            children: const [
              PortfolioHeroWidget(),
              SizedBox.square(dimension: 64),
              PortfolioHighlightsWidget(),
              SizedBox.square(dimension: 64),
              PortfolioScreenshotsWidget(
                screenshotPaths: [
                  "assets/images/screenshots/tg/tg_ss_1.webp",
                  "assets/images/screenshots/tg/tg_ss_2.webp",
                  "assets/images/screenshots/tg/tg_ss_3.webp",
                  "assets/images/screenshots/tg/tg_ss_4.webp",
                  "assets/images/screenshots/tg/tg_ss_5.webp",
                  "assets/images/screenshots/tg/tg_ss_6.webp",
                  "assets/images/screenshots/tg/tg_ss_7.webp",
                ],
              ),
              SizedBox.square(dimension: 64),
              PortfolioMoreExplanationsWidget(),
              SizedBox.square(dimension: 64),
              SeeMoreWorkWidget(),
              SizedBox.square(dimension: 64),
            ],
          ),
        ],
      ),
    );
  }
}
