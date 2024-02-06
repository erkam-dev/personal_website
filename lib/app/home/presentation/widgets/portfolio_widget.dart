import 'package:flutter/material.dart';
import 'package:personal_website/app/app.dart';
import 'package:personal_website/app/portfolio/presentation/screens/portfolio_screen.dart';
import 'package:personal_website/core/core.dart';
import 'package:personal_website/core/extensions/layout_extension.dart';

class PortfolioWidget extends StatelessWidget {
  const PortfolioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Portfolio",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ).padOnly(bottom: 16),
        SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 32,
            runSpacing: 16,
            children: [
              ContentItemWidget(
                imagePath: "assets/images/thumbnails/tg_thumbnail.png",
                title: "TeklifimGelsin",
                description: "Personalized Financial Market Place & Assistant",
                width: 400,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PortfolioScreen())),
              ),
              const ContentItemWidget(
                imagePath: "assets/images/thumbnails/decisionai_thumbnail.png",
                title: "Decision AI",
                description: "Making the decision-making process a breeze",
                width: 400,
              ),
            ],
          ),
        )
            .constrainedBox(
              BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height - 180),
            )
            .roundBorder24(),
      ],
    ).maxDesktopWidth();
  }
}
