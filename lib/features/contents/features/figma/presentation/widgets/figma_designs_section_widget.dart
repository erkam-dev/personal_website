import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/core/core.dart';
import 'package:url_launcher/url_launcher.dart';

import '../presentation.dart';

class FigmaDesignsSectionWidget extends StatelessWidget {
  const FigmaDesignsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    FigmaBloc figmaBloc = BlocProvider.of<FigmaBloc>(context);
    return BlocBuilder(
      bloc: figmaBloc,
      builder: (context, state) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListTile(
              onTap: () => launchUrl(
                  Uri.parse('https://www.figma.com/files/project/90918879')),
              title: Text("Figma Designs",
                  style: Theme.of(context).textTheme.titleLarge),
              trailing: Icon(Icons.navigate_next_rounded),
            ),
          ),
          SizedBox(
            height: 240,
            child: (state.runtimeType == FigmaLoading)
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemExtent: 300,
                    children: figmaBloc.projectFiles.map((e) {
                      openDesignFile({key, isPrototype}) => Navigator.push(
                          context,
                          HeroDialogRoute(
                              fullscreenDialog: true,
                              builder: (context) => FigmaFileDetailsScreen(
                                  figmaFile: e, isPrototype: isPrototype)));
                      return Hero(
                        tag: e,
                        child: Card(
                          child: InkWell(
                            onTap: () =>
                                openDesignFile(key: e.key, isPrototype: false),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surfaceVariant,
                                    child: Image.network(
                                      e.thumbnailUrl,
                                      width: 300,
                                      height: 175,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    )),
                                ListTile(
                                  title: Text(
                                    e.name,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  dense: true,
                                  trailing: OutlinedButton(
                                    onPressed: () => openDesignFile(
                                        key: e.key, isPrototype: true),
                                    child:
                                        const Icon(Icons.play_arrow_outlined),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
