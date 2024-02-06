import 'package:flutter/material.dart';
import 'package:personal_website/lib.dart';
import 'package:url_launcher/url_launcher.dart';

enum StoreType { appstore, playstore }

class StoreDownloadButton extends StatelessWidget {
  final String? redirectionUrl;
  final StoreType storeType;
  const StoreDownloadButton({
    super.key,
    this.redirectionUrl,
    required this.storeType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(storeType == StoreType.appstore
            ? "assets/images/icons/apple.png"
            : storeType == StoreType.playstore
                ? "assets/images/icons/play.png"
                : ""),
        Column(
          children: [
            const Text("Download on the"),
            Text(storeType == StoreType.appstore
                ? "App Store"
                : storeType == StoreType.playstore
                    ? "Google Play"
                    : ""),
          ],
        )
      ],
    ).pad8().inkwell(() {
      if ((redirectionUrl ?? "").isNotEmpty) {
        launchUrl(Uri.parse(redirectionUrl!));
      }
    }).card();
  }
}
