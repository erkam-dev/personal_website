import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/app/app.dart';
import 'package:personal_website/core/core.dart';

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
            children: [
              PortfolioItemWidget(
                imagePath: "assets/images/thumbnails/tg_thumbnail.png",
                title: "TeklifimGelsin",
                description: "Personalized Financial Market Place & Assistant",
                onTap: () => context.go("/portfolio/teklifimgelsin"),
              ),
              PortfolioItemWidget(
                imagePath: "assets/images/thumbnails/decisionai_thumbnail.png",
                title: "Decision AI",
                description: "Making the decision-making process a breeze",
                onTap: () => context.go("/portfolio/decision-ai"),
              ),
            ],
          ),
        )
            .constrainedBox(
              BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height - 100),
            )
            .roundBorder24(),
      ],
    ).maxDesktopWidth();
  }
}
