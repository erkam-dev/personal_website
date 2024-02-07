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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white54,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).colorScheme.surfaceVariant),
        borderRadius: context.borderRadius24(),
      ),
      child: Column(
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
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
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
      ).inkwell(onTap),
    ).sizedBox(width: width ?? 480);
  }
}
