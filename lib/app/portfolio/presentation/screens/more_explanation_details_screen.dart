import 'package:flutter/material.dart';

import '../../../../lib.dart';

class MoreExplanationDetailsScreen extends StatelessWidget {
  final String title;
  final String content;
  const MoreExplanationDetailsScreen({
    super.key,
    required this.title,
    required this.content,
  });

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
            tag: title,
            transitionOnUserGestures: true,
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
                backgroundColor: Colors.white24,
                appBar: AppBar(
                  title: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                body: SelectableText(
                  content,
                  style: Theme.of(context).textTheme.bodyLarge,
                ).pad16(),
              ),
            ).customCard(
                margin: EdgeInsets.zero,
                borderRadius: c.biggest.width < mobileBp ? 0 : null),
          ),
        ),
      ),
    );
  }
}
