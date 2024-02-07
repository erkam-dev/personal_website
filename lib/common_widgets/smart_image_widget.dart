import 'package:flutter/material.dart';
import 'package:personal_website/core/core.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SmartImageWidget extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  const SmartImageWidget(
      {super.key, required this.imagePath, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return (imagePath.startsWith("assets")
        ? Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: width,
            height: height,
          )
        : imagePath.isNotEmpty
            ? WebViewX(
                width: width ?? 480,
                height: height ?? 270,
                initialSourceType: SourceType.html,
                ignoreAllGestures: true,
                initialContent: """
    <html>
      <head>
        <style>
          body::-webkit-scrollbar {
            display: none;
          }
        </style>
      </head>
      <img src="$imagePath" style="width: 100%; height: auto;">
    </html>""",
              ).scale(1.05)
            : const SizedBox());
  }
}
