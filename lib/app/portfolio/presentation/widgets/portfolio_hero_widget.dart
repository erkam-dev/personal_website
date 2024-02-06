import 'package:flutter/material.dart';
import 'package:personal_website/app/portfolio/presentation/widgets/store_download_button.dart';

class PortfolioHeroWidget extends StatelessWidget {
  const PortfolioHeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/images/screenshots/tg/tg_ss_1.webp",
          width: 300,
        ),
        Column(
          children: [
            Image.asset("assets/images/icons/app/tg.png"),
            const Text("TeklifimGelsin"),
            const Text(
                "Lorem ipsum dolor sit amet consectetur. Ultrices nibh dui ut ornare proin eget scelerisque pharetra. Sit cursus eu eu cursus egestas velit."),
            const Row(
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
      ],
    );
  }
}
