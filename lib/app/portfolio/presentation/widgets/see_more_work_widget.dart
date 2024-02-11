import 'package:flutter/material.dart';
import 'package:personal_website/lib.dart';

class SeeMoreWorkWidget extends StatelessWidget {
  final List<PortfolioItemWidget>? items;
  const SeeMoreWorkWidget({super.key, this.items});

  @override
  Widget build(BuildContext context) {
    return (items ?? []).isEmpty
        ? const SizedBox()
        : Column(
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
              ...items!
            ],
          ).maxDesktopWidth();
  }
}
