// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:personal_website/core/constants/layout_breakpoints.dart';

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
  void initState() {
    super.initState();
    final element = IFrameElement()
      ..src = 'https://www.figma.com/embed?embed_host=astra&'
          'url=https://www.figma.com/${widget.isPrototype ? "proto" : "file"}'
          '/${widget.figmaFile.key}'
      ..title = widget.figmaFile.name
      ..allowFullscreen = true;
    //ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      widget.figmaFile.key + widget.isPrototype.toString(),
      (int viewId) => element,
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
                child: Scaffold(
                  appBar: AppBar(title: Text(widget.figmaFile.name)),
                  body: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      child: HtmlElementView(
                          viewType: widget.figmaFile.key +
                              widget.isPrototype.toString()),
                    ),
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
