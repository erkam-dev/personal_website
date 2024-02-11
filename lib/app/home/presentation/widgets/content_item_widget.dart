import 'package:flutter/material.dart';

import '../../../../lib.dart';

class ContentItemWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double? width;
  final double? height;
  final Function()? onTap;

  const ContentItemWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.height,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SmartImageWidget(
          imagePath: imagePath,
          width: width,
          height: height,
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
        ).pad8(),
      ],
    )
        .inkwell(onTap)
        .customCard(margin: context.edgeInsets16())
        .sizedBox(width: width ?? 480);
  }
}
