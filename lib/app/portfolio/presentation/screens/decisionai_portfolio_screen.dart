import 'package:flutter/material.dart';

import '../../../../lib.dart';

class DecisionaiPortfolioScreen extends StatelessWidget {
  const DecisionaiPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PortfolioScreen(
      screenshotPathList: const [
        "assets/images/screenshots/decisionai/decisionai_ss_1.webp",
        "assets/images/screenshots/decisionai/decisionai_ss_2.webp",
        "assets/images/screenshots/decisionai/decisionai_ss_3.webp",
        "assets/images/screenshots/decisionai/decisionai_ss_4.webp",
        "assets/images/screenshots/decisionai/decisionai_ss_5.webp",
        "assets/images/screenshots/decisionai/decisionai_ss_6.webp",
        "assets/images/screenshots/decisionai/decisionai_ss_7.webp",
      ],
      iconPath: "assets/images/icons/app/decisionai.png",
      title: "Decision AI",
      description: "Making the decision-making process a breeze",
      appleRedirectionLink: "https://apps.apple.com/app/id6471530058",
      playRedirectionLink:
          "https://play.google.com/store/apps/details?id=com.decisionmaker.ai",
      highlightItems: const [
        HighlightsItemWidget(
          imagePath:
              "assets/images/highlights/decisionai/decisionai_hl_compare.webp",
          title: "Compare Two Options",
          description:
              "Enter two options you want to compare or make a decision about, and why you want to compare them.",
        ),
        HighlightsItemWidget(
          imagePath:
              "assets/images/highlights/decisionai/decisionai_hl_importance.webp",
          title: "Determine importance",
          description:
              "Answer questions and criteria prepared by artificial intelligence based on their importance to you, and evaluate different perspectives.",
        ),
        HighlightsItemWidget(
          imagePath:
              "assets/images/highlights/decisionai/decisionai_hl_result.webp",
          title: "Explore Results",
          description:
              "Discover which option to choose based on your prioritized criteria and answers given.",
        ),
        HighlightsItemWidget(
          imagePath:
              "assets/images/highlights/decisionai/decisionai_hl_share.webp",
          title: "Share Your Experience",
          description:
              "Tap the share icon on the results screen to easily share these results with your friends.",
        ),
      ],
      moreExplanations: const [
        {
          "title": "The App’s Structure",
          "body":
              """The Decision AI app went through a rapid development cycle from concept to launch, targeting both Android and iOS platforms in a compressed timeframe of about a month. Leveraging the versatile Flutter framework, I spearheaded the development process and ensured seamless compatibility and performance on both operating systems. Using a pre-made glass design in Figma, I meticulously customized the visual elements of the app to have a sleek and modern aesthetic.

In addition to my role in app development, I also played an important role in the development of the app's AI capabilities. I actively contributed to the creation of prompts and algorithms, leveraging my expertise in AI to optimize decision-making processes within the app. This involved extensive research into machine learning techniques and natural language processing to ensure the efficiency and accuracy of AI-based prompts.

The user interface design posed unique challenges, especially in mitigating the side effects of blur effects and ensuring optimal user experience in the data flow. To overcome these challenges, I applied advanced state management techniques using the Bloc architecture, ensuring efficient data flow and seamless interaction within the application.

Moreover, Decision AI includes monetization strategies through the integration of Google Admob ads. This strategic partnership not only provides a source of revenue, but also increases user engagement by delivering relevant and targeted ads. As I continue to develop the app, I will remain committed to continuous development and improvement initiatives to ensure that Decision AI remains at the forefront of innovation in the field of decision-making assistants.
""",
        },
        {
          "title": "My Journey At TeklifimGelsin",
          "body":
              """Embarking on the journey of developing Decision AI proved to be an enriching experience as I explored the cutting-edge field of AI to create a sophisticated decision-making assistant. As a freelance developer, it has been a pleasure to immerse myself in the intricacies of app development, especially in the area of customizing prompts and refining AI architecture.

Navigating the complexities of interface design presented its own challenges to ensure a seamless user experience. Through rigorous problem solving and innovative solutions, I overcame these obstacles and took the experience of the app to new heights.

In the quest for optimal performance and scalability, I implemented Bloc architecture for efficient state management and built a solid foundation for seamless data flow and interaction within the app. I also strategically integrated Google Admob ads, not only as a monetization strategy, but also as a way to increase user engagement through targeted advertising.

As my journey with Decision AI continues, so does my commitment to continuous improvement and development. It has been a great experience for me to leverage the latest advancements in technology and user experience design to deliver an intuitive and effective decision-making tool that empowers users to make informed choices with confidence.
""",
        },
      ],
      otherWorks: [
        PortfolioItemWidget(
          imagePath: "assets/images/thumbnails/tg_thumbnail.png",
          title: "TeklifimGelsin",
          description: "Personalized Financial Market Place & Assistant",
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const TgPortfolioScreen()));
          },
        )
      ],
    );
  }
}
