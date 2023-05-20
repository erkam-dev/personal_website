// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:personal_website/core/constants/layout_breakpoints.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../youtube.dart';

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
    return LayoutBuilder(
      builder: (context, c) => Align(
        alignment: Alignment.center,
        child: Padding(
          padding: c.biggest.width < mobileBp
              ? EdgeInsets.zero
              : const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Hero(
            tag: widget.video,
            transitionOnUserGestures: true,
            child: Card(
              shape: c.biggest.width < mobileBp
                  ? const RoundedRectangleBorder()
                  : null,
              margin: EdgeInsets.zero,
              child: ConstrainedBox(
                constraints: c.biggest.width < mobileBp
                    ? const BoxConstraints()
                    : const BoxConstraints(
                        maxHeight: 1000,
                        minHeight: 300,
                        maxWidth: 1000,
                        minWidth: 500,
                      ),
                child: Scaffold(
                  appBar: AppBar(title: Text(widget.video.title)),
                  body: ListView(padding: const EdgeInsets.all(15), children: [
                    Card(
                      child: YoutubePlayer(
                          controller: YoutubePlayerController.fromVideoId(
                        videoId: widget.video.id,
                        autoPlay: true,
                        params: params,
                      )),
                    ),
                    SelectableText(
                      widget.video.description,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
