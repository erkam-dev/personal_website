import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/figma/figma.dart';

class HiScreen extends StatelessWidget {
  const HiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FigmaBloc figmaBloc = BlocProvider.of<FigmaBloc>(context);
    List images = [
      "assets/images/sliver-appbar.png",
      "assets/images/customicon.png",
      "assets/images/material-you.png",
    ];
    return BlocBuilder(
      bloc: figmaBloc,
      builder: (context, state) => LayoutBuilder(
        builder: (p0, c) => Center(
          child: SizedBox(
            width: c.biggest.width > 1200 ? 1200 : null,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/pp.png",
                        scale: 7,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Hi, I’m Erkam. Welcome!",
                          textScaleFactor: 1.7,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ListTile(
                    title: Text(
                      "Latest Videos",
                      style: Theme.of(context).textTheme.titleLarge,
                      textScaleFactor: 1.3,
                    ),
                    trailing: FilledButton.tonal(
                      onPressed: () {
                        figmaBloc.add(GetProjectFiles());
                      },
                      child: const Icon(Icons.navigate_next_rounded),
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemExtent: 300,
                    children: images
                        .map((e) => Card(
                              child: InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  child: ListView(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      Card(child: Image.asset(e)),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        child: Text(
                                          "Title goes here!",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
