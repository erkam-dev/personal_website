import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:personal_website/core/core.dart';

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
          (imagePath.startsWith("assets")
                  ? Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    )
                  : ImageNetwork(
                      image: imagePath,
                      height: 180,
                      width: 320,
                      fullScreen: true,
                    ))
              .aspectRatio(16 / 9),
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
          ).pad8(),
        ],
      ),
    ).sizedBox(width: width ?? 320, height: height).inkwell(onTap);
  }
}
