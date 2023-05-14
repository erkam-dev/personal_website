// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:personal_website/features/youtube/youtube.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeVideoDetailsScreen extends StatefulWidget {
  final YoutubeVideo video;
  const YoutubeVideoDetailsScreen({super.key, required this.video});

  @override
  State<YoutubeVideoDetailsScreen> createState() =>
      _YoutubeVideoDetailsScreenState();
}

class _YoutubeVideoDetailsScreenState extends State<YoutubeVideoDetailsScreen> {
  var params = const YoutubePlayerParams();
  @override
  void initState() {
    super.initState();
    params = const YoutubePlayerParams(
      enableCaption: true,
      showControls: true,
      showFullscreenButton: true,
      strictRelatedVideos: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Hero(
          tag: widget.video,
          child: Card(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 800,
                minHeight: 300,
                maxWidth: 1000,
                minWidth: 500,
              ),
              child: ListView(padding: const EdgeInsets.all(15), children: [
                Card(
                  child: YoutubePlayer(
                      controller: YoutubePlayerController.fromVideoId(
                    videoId: widget.video.id,
                    autoPlay: true,
                    params: params,
                  )),
                ),
                ListTile(
                  title: Text(
                    widget.video.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      widget.video.description,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
