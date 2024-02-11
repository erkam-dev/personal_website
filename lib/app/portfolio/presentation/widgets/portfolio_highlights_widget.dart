import 'package:flutter/material.dart';
import 'package:personal_website/core/core.dart';

import 'widgets.dart';

class PortfolioHighlightsWidget extends StatelessWidget {
  final List<HighlightsItemWidget>? highlightItems;
  const PortfolioHighlightsWidget({super.key, this.highlightItems});

  @override
  Widget build(BuildContext context) {
    return (highlightItems ?? []).isEmpty
        ? const SizedBox()
        : Column(
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
                children: highlightItems ?? [],
              )
            ],
          ).pad16().maxDesktopWidth();
  }
}
