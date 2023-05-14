// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../figma.dart';

class FigmaFileDetailsScreen extends StatefulWidget {
  final FigmaFile figmaFile;
  const FigmaFileDetailsScreen({super.key, required this.figmaFile});

  @override
  State<FigmaFileDetailsScreen> createState() => _FigmaFileDetailsScreenState();
}

class _FigmaFileDetailsScreenState extends State<FigmaFileDetailsScreen> {
  @override
  void initState() {
    super.initState();
    final element = IFrameElement()
      ..src =
          """https://www.figma.com/embed?embed_host=astra&url=https://www.figma.com/file/${widget.figmaFile.key}"""
      ..title = widget.figmaFile.name
      ..allowFullscreen = true;
    ui.platformViewRegistry.registerViewFactory(
      widget.figmaFile.key,
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
          tag: widget.figmaFile,
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
                    child: HtmlElementView(viewType: widget.figmaFile.key),
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
