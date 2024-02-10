import 'package:flutter/material.dart';

import '../../../../lib.dart';

class PortfolioItemWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Function()? onTap;

  const PortfolioItemWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SmartImageWidget(
          imagePath: imagePath,
          width: 550,
        ).aspectRatio(2),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ).expanded(),
            const Icon(Icons.navigate_next_rounded)
          ],
        ).pad16(),
      ],
    )
        .inkwell(onTap)
        .customCard(margin: context.edgeInsets16(), borderRadius: 32)
        .sizedBox(width: 550);
  }
}
