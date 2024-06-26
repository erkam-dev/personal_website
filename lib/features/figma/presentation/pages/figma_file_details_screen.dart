import 'package:flutter/material.dart';
import 'package:personal_website/core/core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

import '../../figma.dart';

class FigmaFileDetailsScreen extends StatelessWidget {
  final FigmaFile figmaFile;
  const FigmaFileDetailsScreen({super.key, required this.figmaFile});

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
            tag: figmaFile,
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
                  appBar: AppBar(
                    title: Text(
                      figmaFile.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    actions: [
                      OutlinedButton.icon(
                        onPressed: () => launchUrl(Uri.parse(
                            "https://www.figma.com/community/file/${figmaFile.key}")),
                        icon: const Icon(Icons.open_in_new_rounded),
                        label: const Text("Open in new tab"),
                      ).padOnly(right: 16)
                    ],
                  ),
                  body: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: context.borderRadius16()),
                        child: WebViewX(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          initialContent:
                              'https://www.figma.com/community/file/${figmaFile.key}/embed',
                        ),
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
