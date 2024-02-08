import 'package:flutter/material.dart';
import 'package:personal_website/lib.dart';

class PortfolioHeroWidget extends StatelessWidget {
  const PortfolioHeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 16,
      spacing: 16,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(width: 400),
            Positioned(
              left: 0,
              bottom: 30,
              child: Image.asset(
                "assets/images/screenshots/tg/tg_ss_2.webp",
                width: 180,
              ).roundBorder8().pad8().customCard(),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              child: Image.asset(
                "assets/images/screenshots/tg/tg_ss_3.webp",
                width: 180,
              ).roundBorder8().pad8().customCard(),
            ),
            Image.asset(
              "assets/images/screenshots/tg/tg_ss_1.webp",
              width: 230,
            ).roundBorder16().pad8().customCard(
                borderRadius: context.borderRadius24(), elevation: 10),
          ],
        ).sizedBox(width: 500),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/icons/app/tg.png").squareBox(100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("TeklifimGelsin",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.white)),
                Text(
                    "Lorem ipsum dolor sit amet consectetur. Ultrices nibh dui ut ornare proin eget scelerisque pharetra. Sit cursus eu eu cursus egestas velit.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white)),
              ],
            ).pad32(horizontal: false),
            const Wrap(
              runSpacing: 16,
              spacing: 16,
              children: [
                StoreDownloadButton(
                  storeType: StoreType.appstore,
                  redirectionUrl: "https://apps.apple.com/tr/app/id6443582957",
                ),
                StoreDownloadButton(
                  storeType: StoreType.playstore,
                  redirectionUrl:
                      "https://play.google.com/store/apps/details?id=com.teklifimgelsin.romulus",
                ),
              ],
            )
          ],
        )
            .constrainedBox(const BoxConstraints(minWidth: 300, maxWidth: 600))
            .pad16()
      ],
    ).maxDesktopWidth();
  }
}
