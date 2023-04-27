import 'package:flutter/material.dart';

class HiScreen extends StatelessWidget {
  const HiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List images = [
      "assets/images/sliver-appbar.png",
      "assets/images/customicon.png",
      "assets/images/material-you.png",
    ];
    return LayoutBuilder(
      builder: (p0, c) => ListView(
        padding:
            EdgeInsets.symmetric(horizontal: c.biggest.width > 1000 ? 100 : 30),
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/pp.png",
                  scale: c.biggest.width > 800 ? 5 : 7,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Hi, I’m Erkam. Welcome!",
                    textScaleFactor: c.biggest.width > 800 ? 2 : 1.7,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              "YouTube Videos",
              style: Theme.of(context).textTheme.titleLarge,
              textScaleFactor: c.biggest.width > 800 ? 1.5 : 1.3,
            ),
            trailing: FilledButton.tonal(
              onPressed: () {},
              child: const Icon(Icons.navigate_next_rounded),
            ),
          ),
          Row(
            children: images
                .map((e) => Expanded(
                      child: Card(
                        child: InkWell(
                          onTap: () {},
                          child: SizedBox(
                            child: ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Image.asset(e),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text(
                                    "Title goes here!",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
