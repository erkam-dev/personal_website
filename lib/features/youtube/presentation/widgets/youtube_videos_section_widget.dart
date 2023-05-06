// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation.dart';

class YoutubeVideosSectionWidget extends StatelessWidget {
  const YoutubeVideosSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    YoutubeBloc youtubeBloc = BlocProvider.of<YoutubeBloc>(context);
    return BlocBuilder(
      bloc: youtubeBloc,
      builder: (context, state) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListTile(
              title: Text(
                "Latest Videos",
                style: Theme.of(context).textTheme.titleLarge,
                textScaleFactor: 1.3,
              ),
              trailing: FilledButton.tonal(
                onPressed: () => html.window.open(
                    'https://www.youtube.com/files/project/90918879',
                    'new tab'),
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
              children: youtubeBloc.projectFiles
                  .map((e) => Card(
                        child: InkWell(
                          onTap: () => html.window.open(
                              'https://www.youtube.com/file/${e.key}',
                              'new tab'),
                          child: SizedBox(
                            child: ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surfaceVariant,
                                    child: Image.network(
                                      e.thumbnailUrl,
                                      height: 175,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Text(
                                        "Last Modified: ${e.lastModified.day}/${e.lastModified.month}/${e.lastModified.year}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
