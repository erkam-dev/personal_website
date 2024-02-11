import 'package:flutter/material.dart';
import 'package:personal_website/app/app.dart';
import 'package:personal_website/app/portfolio/presentation/screens/decisionai_portfolio_screen.dart';
import 'package:personal_website/app/portfolio/presentation/screens/tg_portfolio_screen.dart';
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
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TgPortfolioScreen())),
              ),
              PortfolioItemWidget(
                imagePath: "assets/images/thumbnails/decisionai_thumbnail.png",
                title: "Decision AI",
                description: "Making the decision-making process a breeze",
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DecisionaiPortfolioScreen())),
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
