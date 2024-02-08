import 'package:flutter/material.dart';
import 'package:personal_website/lib.dart';

class SeeMoreWorkWidget extends StatelessWidget {
  const SeeMoreWorkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Explore Other Works",
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
        ContentItemWidget(
          imagePath: "assets/images/thumbnails/decisionai_thumbnail.png",
          title: "Decision AI",
          description: "Making the decision-making process a breeze",
          width: 550,
          onTap: () {},
        )
      ],
    ).maxDesktopWidth();
  }
}
