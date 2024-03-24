import 'package:flutter/material.dart';
import 'package:personal_website/app/portfolio/presentation/screens/decisionai_portfolio_screen.dart';

import '../../../../lib.dart';

class TgPortfolioScreen extends StatelessWidget {
  const TgPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PortfolioScreen(
      screenshotPathList: const [
        "assets/images/screenshots/tg/tg_ss_1.webp",
        "assets/images/screenshots/tg/tg_ss_2.webp",
        "assets/images/screenshots/tg/tg_ss_3.webp",
        "assets/images/screenshots/tg/tg_ss_4.webp",
        "assets/images/screenshots/tg/tg_ss_5.webp",
        "assets/images/screenshots/tg/tg_ss_6.webp",
        "assets/images/screenshots/tg/tg_ss_7.webp",
      ],
      iconPath: "assets/images/icons/app/tg.png",
      title: "TeklifimGelsin",
      description: "Personalized Financial Market Place & Assistant",
      appleRedirectionLink: "https://apps.apple.com/tr/app/id6443582957",
      playRedirectionLink:
          "https://play.google.com/store/apps/details?id=com.teklifimgelsin.romulus",
      highlightItems: const [
        HighlightsItemWidget(
          imagePath: "assets/images/highlights/tg/tg_hl_store.webp",
          title: "+400.000 Active User",
          description:
              "In 2024, Teklifimgelsin reached more than 400,000 users in app stores for both Android and iOS platforms.",
        ),
        HighlightsItemWidget(
          imagePath: "assets/images/highlights/tg/tg_hl_valuation.webp",
          title: "\$14 Million Valuation",
          description:
              "Teklifimgelsin received \$950.000 investment with \$14 million valuation in the beginning of 2024 and became one of the largest financial marketplace startups.",
        ),
        HighlightsItemWidget(
          imagePath: "assets/images/highlights/tg/tg_hl_report.webp",
          title: "TG Credit Report",
          description:
              "Credit Report is a product for users to increase their financial literacy and obtain information about their creditworthiness",
        ),
        HighlightsItemWidget(
          imagePath: "assets/images/highlights/tg/tg_hl_offer.webp",
          title: "Special Offers",
          description:
              "Teklifimgelsin offers personalized loan, credit card, investment and various other offers tailored to each user.",
        ),
      ],
      moreExplanations: const [
        {
          "title": "The App’s Structure",
          "body":
              """Teklifimgelsin Mobile App has been meticulously crafted from scratch using Flutter for 1.5 years. It takes the MVP approach and customizes Material Design 3 for UI consistency. The app embraces automation and architectural integrity. It supports features such as push notifications, analytics, A/B testing, remote configuration, in-app web view browser, native in-app purchasing and custom in-app ad tracking.

The development of the app was quite challenging and faced a number of technical challenges. In particular, the integration of push notifications was a major challenge. Technical details such as optimizing the in-app web view browser and integrating local purchases were also worked on.

Future plans for Teklifimgelsin include adding new features and improving existing ones to enhance the user experience. For example, a more user-friendly interface design and faster performance are targeted. It also plans to introduce new services and products based on user feedback.

In this process, the focus is on continuous development and learning to adapt to technological innovations and market trends. The use of innovative technologies such as Flutter has increased the competitive advantage of the application and provided a more flexible and scalable structure.""",
        },
        {
          "title": "My Journey At TeklifimGelsin",
          "body":
              """During my tenure at Teklifimgelsin, I led the development of the app and guided its transformation into a market-leading financial assistant. I meticulously designed the app using Flutter and managed to achieve a smooth and intuitive user experience.

One of the key challenges I faced during the development process was to ensure scalability and maintainability as the complexity of the application increased. I applied software architecture best practices such as modularization and clean code principles to ensure the long-term viability and maintainability of the application.

In addition to technical leadership, I also played an important role in fostering a collaborative and inclusive team culture. I organized regular knowledge sharing sessions and fostered open communication between team members, fostering a sense of ownership and accountability for the success of the project.

As part of my responsibilities, I also conducted extensive user research and feedback analysis to continuously iterate and improve the app's features. This iterative approach enabled us to remain agile and responsive to user needs, resulting in a product that truly resonated with our target audience.

I also championed the importance of user security and data privacy throughout the development process, ensuring compliance with industry standards and regulations by implementing robust security measures to protect user information and build trust with our audience.

Overall, my time at Teklifimgelsin has been marked by a relentless pursuit of excellence and innovation. I am proud to have played a central role in building the app into what it is today: a market-leading financial assistant that allows users to take control of their finances with confidence and ease.
""",
        },
      ],
      otherWorks: [
        PortfolioItemWidget(
          imagePath: "assets/images/thumbnails/decisionai_thumbnail.png",
          title: "Decision AI",
          description: "Making the decision-making process a breeze",
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DecisionaiPortfolioScreen()));
          },
        )
      ],
    );
  }
}
