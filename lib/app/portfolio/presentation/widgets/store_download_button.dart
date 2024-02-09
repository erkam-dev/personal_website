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
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(storeType == StoreType.appstore
                ? "assets/images/icons/apple.png"
                : storeType == StoreType.playstore
                    ? "assets/images/icons/play.png"
                    : "")
            .squareBox(20)
            .padOnly(right: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Download on the",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(height: 1),
            ),
            Text(
              storeType == StoreType.appstore
                  ? "App Store"
                  : storeType == StoreType.playstore
                      ? "Google Play"
                      : "",
              style:
                  Theme.of(context).textTheme.titleSmall!.copyWith(height: 1),
            ),
          ],
        ).colorFiltered(Theme.of(context).colorScheme.primary)
      ],
    ).pad8().inkwell(() {
      if ((redirectionUrl ?? "").isNotEmpty) {
        launchUrl(Uri.parse(redirectionUrl!));
      }
    }).customCard(borderRadius: 8, margin: EdgeInsets.zero);
  }
}
