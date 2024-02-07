import 'package:flutter/material.dart';
import 'package:personal_website/core/core.dart';

import 'widgets.dart';

class PortfolioHighlightsWidget extends StatelessWidget {
  const PortfolioHighlightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Highlights",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ).padOnly(bottom: 24),
        GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 600,
              mainAxisExtent: 400,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HighlightsItemWidget(
              imagePath: "assets/images/highlights/tg/tg_hl_valuation.webp",
              title: "\$14 Million Valuation",
              description:
                  "Lorem ipsum dolor sit amet consectetur. Ultrices nibh dui ut ornare proin eget scelerisque pharetra. Sit cursus eu eu cursus egestas velit.",
            ),
            HighlightsItemWidget(
              imagePath: "assets/images/highlights/tg/tg_hl_valuation.webp",
              title: "\$14 Million Valuation",
              description:
                  "Lorem ipsum dolor sit amet consectetur. Ultrices nibh dui ut ornare proin eget scelerisque pharetra. Sit cursus eu eu cursus egestas velit.",
            ),
            HighlightsItemWidget(
              imagePath: "assets/images/highlights/tg/tg_hl_valuation.webp",
              title: "\$14 Million Valuation",
              description:
                  "Lorem ipsum dolor sit amet consectetur. Ultrices nibh dui ut ornare proin eget scelerisque pharetra. Sit cursus eu eu cursus egestas velit.",
            ),
            HighlightsItemWidget(
              imagePath: "assets/images/highlights/tg/tg_hl_valuation.webp",
              title: "\$14 Million Valuation",
              description:
                  "Lorem ipsum dolor sit amet consectetur. Ultrices nibh dui ut ornare proin eget scelerisque pharetra. Sit cursus eu eu cursus egestas velit.",
            ),
          ],
        )
      ],
    ).pad16().maxDesktopWidth();
  }
}
