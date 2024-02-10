import 'package:flutter/material.dart';
import 'package:personal_website/lib.dart';

class PortfolioMoreExplanationsWidget extends StatelessWidget {
  final List<Map<String, String>>? contents;
  const PortfolioMoreExplanationsWidget({super.key, this.contents});

  @override
  Widget build(BuildContext context) {
    return (contents ?? []).isEmpty
        ? const SizedBox()
        : Column(
            children: [
              Text(
                "Behind The Scene",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white),
              ),
              Column(
                children: contents!
                    .map(
                      (e) => Hero(
                        tag: e['title'] ?? "",
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing: 16,
                                  runSpacing: 16,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    const Icon(Icons.construction_rounded,
                                        size: 32),
                                    Text(
                                      e['title'] ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ).colorFiltered(Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer),
                                Text(
                                  e['body'] ?? "",
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                ).expandWidth(),
                              ],
                            )
                                .pad32()
                                .inkwell(() {
                                  Navigator.push(
                                      context,
                                      HeroDialogRoute(
                                        builder: (context) =>
                                            MoreExplanationDetailsScreen(
                                          title: e['title'] ?? "",
                                          content: e['body'] ?? "",
                                        ),
                                      ));
                                })
                                .roundBorder32()
                                .customCard(borderRadius: 32),
                            Positioned(
                              right: 12,
                              top: 12,
                              child: Row(
                                children: [
                                  Text(
                                    "Expand",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  ),
                                  Icon(Icons.unfold_more_rounded,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ],
                              ).ignorePointer(),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ).pad16().maxDesktopWidth();
  }
}
