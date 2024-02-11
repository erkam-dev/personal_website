import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/core/core.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../youtube.dart';

class YoutubeVideosSectionWidget extends StatelessWidget {
  const YoutubeVideosSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    YoutubeBloc youtubeBloc = BlocProvider.of<YoutubeBloc>(context);
    openVideo(YoutubeVideo video) {
      return Navigator.push(
          context,
          HeroDialogRoute(
              fullscreenDialog: true,
              builder: (context) => YoutubeVideoDetailsScreen(video: video)));
    }

    return BlocBuilder(
      bloc: youtubeBloc,
      builder: (context, state) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListTile(
              onTap: () =>
                  launchUrl(Uri.parse('https://www.youtube.com/@erkam_dev')),
              title: Text("YouTube Videos",
                  style: Theme.of(context).textTheme.titleLarge),
              trailing: const Icon(Icons.navigate_next_rounded),
            ),
          ),
          SizedBox(
            height: 250,
            child: (state.runtimeType == YoutubeLoading)
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemExtent: 300,
                    children: youtubeBloc.youtubeVideos.map((e) {
                      return Hero(
                        tag: e,
                        transitionOnUserGestures: true,
                        child: Card(
                          child: InkWell(
                            onTap: () => openVideo(e),
                            child: ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surfaceVariant,
                                    child: SizedBox(
                                      height: 150,
                                      child: Image.network(
                                        "https://i3.ytimg.com/vi/${e.id}/maxresdefault.jpg",
                                        width: 300,
                                        height: 150,
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
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 5),
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
