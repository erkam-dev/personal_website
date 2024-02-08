import 'package:flutter/material.dart';
import 'package:personal_website/lib.dart';

class PortfolioMoreExplanationsWidget extends StatelessWidget {
  const PortfolioMoreExplanationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Behind The Scene",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(Icons.construction_rounded, size: 32),
                    Text(
                      "The App’s Structure",
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ).colorFiltered(
                    Theme.of(context).colorScheme.onPrimaryContainer),
                const Text(
                  "Lorem ipsum dolor sit amet consectetur. Vitae diam vitae cras sit hac pretium sed feugiat. Gravida convallis eros eu rutrum bibendum tellus ullamcorper ac posuere. Fringilla eget eget ultrices pharetra tellus diam. Ultrices nisl vitae facilisi risus pellentesque elementum magna facilisi rhoncus. Viverra malesuada dolor nam scelerisque massa. Pellentesque id etiam aliquet viverra molestie sed ullamcorper sit. Et rutrum luctus diam ac augue nec lacus vitae velit. Proin risus facilisis risus sit in vitae dignissim massa. Eu dictum volutpat mauris ut tempor facilisis malesuada. Imperdiet neque vel at lectus. Gravida blandit adipiscing sed viverra ipsum commodo bibendum tempor sit. Eget id quis maecenas ut nibh sit quam vitae malesuada. Dictum sollicitudin urna lacus nibh suspendisse magna scelerisque. Leo purus vulputate amet viverra. Justo maecenas est ac ullamcorper cras sodales.",
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ).expandWidth(),
              ],
            )
                .pad32()
                .inkwell(() {})
                .roundBorder32()
                .customCard(borderRadius: context.borderRadius32()),
            Positioned(
              right: 12,
              top: 12,
              child: const Row(
                children: [
                  Text("Expand"),
                  Icon(Icons.unfold_more_rounded),
                ],
              )
                  .colorFiltered(Theme.of(context).colorScheme.secondary)
                  .ignorePointer(),
            )
          ],
        ),
        const SizedBox.square(dimension: 16),
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(Icons.hiking_rounded, size: 32),
                    Text(
                      "My Journey at TeklifimGelsin",
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ).colorFiltered(
                    Theme.of(context).colorScheme.onPrimaryContainer),
                const Text(
                  "Lorem ipsum dolor sit amet consectetur. Vitae diam vitae cras sit hac pretium sed feugiat. Gravida convallis eros eu rutrum bibendum tellus ullamcorper ac posuere. Fringilla eget eget ultrices pharetra tellus diam. Ultrices nisl vitae facilisi risus pellentesque elementum magna facilisi rhoncus. Viverra malesuada dolor nam scelerisque massa. Pellentesque id etiam aliquet viverra molestie sed ullamcorper sit. Et rutrum luctus diam ac augue nec lacus vitae velit. Proin risus facilisis risus sit in vitae dignissim massa. Eu dictum volutpat mauris ut tempor facilisis malesuada. Imperdiet neque vel at lectus. Gravida blandit adipiscing sed viverra ipsum commodo bibendum tempor sit. Eget id quis maecenas ut nibh sit quam vitae malesuada. Dictum sollicitudin urna lacus nibh suspendisse magna scelerisque. Leo purus vulputate amet viverra. Justo maecenas est ac ullamcorper cras sodales.",
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ).expandWidth(),
              ],
            )
                .pad32()
                .inkwell(() {})
                .roundBorder32()
                .customCard(borderRadius: context.borderRadius32()),
            Positioned(
              right: 12,
              top: 12,
              child: const Row(
                children: [
                  Text("Expand"),
                  Icon(Icons.unfold_more_rounded),
                ],
              ).colorFiltered(Theme.of(context).colorScheme.secondary),
            )
          ],
        )
      ],
    ).pad16().maxDesktopWidth();
  }
}
