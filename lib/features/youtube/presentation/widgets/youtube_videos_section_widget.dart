import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

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
                "YouTube Videos",
                style: Theme.of(context).textTheme.titleLarge,
                textScaleFactor: 1.3,
              ),
              trailing: FilledButton.tonal(
                onPressed: () =>
                    launchUrl(Uri.parse('https://www.youtube.com/@erkam_dev')),
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
              children: (state.runtimeType == YoutubeLoading)
                  ? <Widget>[const Center(child: CircularProgressIndicator())]
                  : youtubeBloc.youtubeVideos
                      .map((e) => Card(
                            child: InkWell(
                              onTap: () => launchUrl(Uri.parse(
                                  'https://www.youtube.com/watch?v=${e.id}')),
                              child: ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  Card(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surfaceVariant,
                                      child: SizedBox(
                                        height: 175,
                                        child: Image(
                                          image: NetworkImage(
                                              "https://img.youtube.com/vi/${e.id}/hqdefault.jpg"),
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          },
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            debugPrint(error.toString());
                                            return const Center(
                                                child: Icon(Icons
                                                    .error_outline_rounded));
                                          },
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "${e.publishedAt.day}/${e.publishedAt.month}/${e.publishedAt.year}",
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
                          ))
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
