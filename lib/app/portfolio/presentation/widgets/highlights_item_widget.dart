import 'package:flutter/material.dart';

import '../../../../lib.dart';

class HighlightsItemWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const HighlightsItemWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagePath),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            Text(description),
          ],
        ).pad8().expanded(),
      ],
    )
        .customCard(borderRadius: context.borderRadius32())
        .constrainedBox(const BoxConstraints(maxWidth: 800, minWidth: 500));
  }
}
