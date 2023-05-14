// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:personal_website/features/youtube/youtube.dart';

class YoutubeVideoDetailsScreen extends StatefulWidget {
  final YoutubeVideo video;
  const YoutubeVideoDetailsScreen({super.key, required this.video});

  @override
  State<YoutubeVideoDetailsScreen> createState() =>
      _YoutubeVideoDetailsScreenState();
}

class _YoutubeVideoDetailsScreenState extends State<YoutubeVideoDetailsScreen> {
  @override
  void initState() {
    super.initState();
    final element = IFrameElement()
      ..src = "https://www.youtube.com/embed/${widget.video.id}"
      ..title = widget.video.title
      ..allowFullscreen = true;
    ui.platformViewRegistry.registerViewFactory(
      widget.video.id,
      (int viewId) => element,
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
                  child: SizedBox(
                    height: 400,
                    child: HtmlElementView(viewType: widget.video.id),
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
