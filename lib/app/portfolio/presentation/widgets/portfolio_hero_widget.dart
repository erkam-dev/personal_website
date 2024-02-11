import 'package:flutter/material.dart';
import 'package:personal_website/lib.dart';

class PortfolioHeroWidget extends StatelessWidget {
  final List<String>? heroScreenshotPathList;
  final String? iconPath;
  final String? title;
  final String? description;
  final String? appleRedirectionLink;
  final String? playRedirectionLink;

  const PortfolioHeroWidget({
    super.key,
    this.heroScreenshotPathList,
    this.iconPath,
    this.title,
    this.description,
    this.appleRedirectionLink,
    this.playRedirectionLink,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> storeDownloadButtons = [];
    if ((appleRedirectionLink ?? "").isNotEmpty) {
      storeDownloadButtons.add(
        StoreDownloadButton(
          storeType: StoreType.appstore,
          redirectionUrl: appleRedirectionLink,
        ),
      );
    }
    if ((playRedirectionLink ?? "").isNotEmpty) {
      storeDownloadButtons.add(
        StoreDownloadButton(
          storeType: StoreType.playstore,
          redirectionUrl: playRedirectionLink,
        ),
      );
    }
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 16,
      spacing: 16,
      children: [
        (heroScreenshotPathList ?? []).isEmpty
            ? const SizedBox()
            : Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(width: 400),
                  Positioned(
                    left: 0,
                    bottom: 30,
                    child: Image.asset(
                      heroScreenshotPathList![1],
                      width: 180,
                    ).roundBorder8().pad8().customCard(),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 30,
                    child: Image.asset(
                      heroScreenshotPathList![2],
                      width: 180,
                    ).roundBorder8().pad8().customCard(),
                  ),
                  Image.asset(
                    heroScreenshotPathList!.first,
                    width: 230,
                  )
                      .roundBorder16()
                      .pad8()
                      .customCard(borderRadius: 24, elevation: 10),
                ],
              ).sizedBox(width: 500),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (iconPath ?? "").isEmpty
                ? const SizedBox()
                : Image.asset(iconPath.toString()).squareBox(100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.white)),
                Text(description ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white)),
              ],
            ).pad32(horizontal: false),
            Wrap(runSpacing: 16, spacing: 16, children: storeDownloadButtons)
          ],
        )
            .constrainedBox(const BoxConstraints(minWidth: 300, maxWidth: 600))
            .pad16()
      ],
    ).maxDesktopWidth();
  }
}
