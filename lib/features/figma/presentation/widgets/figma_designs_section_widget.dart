import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/core/core.dart';
import 'package:personal_website/core/extensions/layout_extension.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListTile(
              onTap: () =>
                  launchUrl(Uri.parse('https://www.figma.com/@erkam_dev')),
              title: Text("Figma Designs",
                  style: Theme.of(context).textTheme.titleLarge),
              trailing: const Icon(Icons.navigate_next_rounded),
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
                      openDesignFile({key}) => Navigator.push(
                          context,
                          HeroDialogRoute(
                              fullscreenDialog: true,
                              builder: (context) =>
                                  FigmaFileDetailsScreen(figmaFile: e)));
                      return Hero(
                        tag: e,
                        child: Card(
                          child: InkWell(
                            onTap: () => openDesignFile(key: e.key),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
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
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  dense: true,
                                  trailing: OutlinedButton(
                                    onPressed: () => launchUrl(Uri.parse(
                                        "https://www.figma.com/community/file/${e.key}")),
                                    child:
                                        const Icon(Icons.open_in_new_rounded),
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
      ).maxDesktopWidth(),
    );
  }
}
