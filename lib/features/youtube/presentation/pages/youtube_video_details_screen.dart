import 'package:flutter/material.dart';
import 'package:personal_website/core/core.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

import '../../youtube.dart';

class YoutubeVideoDetailsScreen extends StatefulWidget {
  final YoutubeVideo video;
  const YoutubeVideoDetailsScreen({super.key, required this.video});

  @override
  State<YoutubeVideoDetailsScreen> createState() =>
      _YoutubeVideoDetailsScreenState();
}

class _YoutubeVideoDetailsScreenState extends State<YoutubeVideoDetailsScreen> {
  late WebViewXController webViewXController;

  @override
  void dispose() {
    webViewXController.dispose();
    super.dispose();
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
                  body: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        expandedHeight: MediaQuery.sizeOf(context).height / 2,
                        automaticallyImplyLeading: false,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        title: IconButton(
                                onPressed: () => context.popWhenPoppable(),
                                icon: const Icon(Icons.close_rounded))
                            .customCard(),
                        stretch: true,
                        flexibleSpace: FlexibleSpaceBar(
                          background: WebViewX(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height,
                            initialSourceType: SourceType.html,
                            onWebViewCreated: (controller) =>
                                webViewXController = controller,
                            initialContent: """ <!DOCTYPE html>
                              <html lang="en">
                              <head>
                                <meta charset="UTF-8">
                                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                <title>Embedded YouTube Video</title>
                                <style>
                                  body, html {
                                            margin: 0;
                                            height: 100%;
                                            overflow: hidden;
                                  }
                                  iframe {
                                            width: 100%;
                                            height: 100%;
                                  }
                                </style>
                              </head>
                              <body>
                                <iframe 
                                  src="https://www.youtube.com/embed/${widget.video.id}?autoplay=1&rel=0" 
                                    title="YouTube video player" 
                                    frameborder="0" 
                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                                    allowfullscreen
                                  ></iframe>
                                </body>
                                </html>""",
                          ).aspectRatio(16 / 9).card().centerWidget(),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            SelectableText(
                              widget.video.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SelectableText(
                              widget.video.description,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
