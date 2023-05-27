import 'package:flutter/material.dart';
import 'package:personal_website/core/constants/layout_breakpoints.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

import '../../figma.dart';

class FigmaFileDetailsScreen extends StatefulWidget {
  final FigmaFile figmaFile;
  final bool isPrototype;
  const FigmaFileDetailsScreen(
      {super.key, required this.figmaFile, required this.isPrototype});

  @override
  State<FigmaFileDetailsScreen> createState() => _FigmaFileDetailsScreenState();
}

class _FigmaFileDetailsScreenState extends State<FigmaFileDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> webviews = [
      WebViewX(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        initialContent: 'https://www.figma.com/embed?embed_host=astra&'
            'url=https://www.figma.com/file'
            '/${widget.figmaFile.key}',
      ),
      WebViewX(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        initialContent: 'https://www.figma.com/embed?embed_host=astra&'
            'url=https://www.figma.com/proto'
            '/${widget.figmaFile.key}',
      ),
    ];
    return LayoutBuilder(
      builder: (context, c) => Align(
        alignment: Alignment.center,
        child: Padding(
          padding: c.biggest.width < mobileBp
              ? EdgeInsets.zero
              : const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Hero(
            tag: widget.figmaFile,
            child: Card(
              margin: EdgeInsets.zero,
              shape: c.biggest.width < mobileBp
                  ? const RoundedRectangleBorder()
                  : null,
              child: ConstrainedBox(
                constraints: c.biggest.width < mobileBp
                    ? const BoxConstraints()
                    : const BoxConstraints(
                        maxHeight: 1000,
                        minHeight: 300,
                        maxWidth: 1000,
                        minWidth: 500,
                      ),
                child: DefaultTabController(
                  length: 2,
                  initialIndex: widget.isPrototype ? 1 : 0,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text(widget.figmaFile.name),
                      bottom: TabBar(
                          tabs: [Tab(text: "Design"), Tab(text: "Prototype")]),
                    ),
                    body: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Card(
                            child: TabBarView(
                          children: webviews,
                          physics: NeverScrollableScrollPhysics(),
                        ))),
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
