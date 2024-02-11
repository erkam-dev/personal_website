import 'package:flutter/material.dart';
import 'package:personal_website/core/core.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<SocialIcon> icons = [
      SocialIcon(
        imagePath: "instagram",
        redirectionUrl: "https://instagram.com/erkam_dev",
      ),
      SocialIcon(
        imagePath: "x",
        redirectionUrl: "https://x.com/erkam_dev",
      ),
      SocialIcon(
        imagePath: "youtube",
        redirectionUrl: "https://youtube.com/@erkam_dev",
      ),
      SocialIcon(
        imagePath: "linkedin",
        redirectionUrl: "https://linkedin.com/in/erkam-dev",
      ),
      SocialIcon(
        imagePath: "play",
        redirectionUrl:
            "https://play.google.com/store/apps/dev?id=6194824417222378281",
      ),
      SocialIcon(
        imagePath: "figma",
        redirectionUrl: "https://figma.com/@erkam_dev",
      ),
      SocialIcon(
        imagePath: "github",
        redirectionUrl: "https://github.com/erkam-dev",
      ),
      SocialIcon(
        imagePath: "medium",
        redirectionUrl: "https://medium.com/@erkam_dev",
      ),
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "About Me",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/pp.png",
                  width: 75,
                  height: 75,
                ),
                FilledButton.icon(
                  onPressed: () =>
                      launchUrl(Uri.parse("mailto:info@erkam.dev")),
                  label: const Text("Send Mail"),
                  icon: const Icon(Icons.mail_outline_rounded),
                ),
              ],
            ),
            const SingleChildScrollView(
              child: Text(
                  """Hi, I'm Erkam. I've been a Flutter developer and UI/UX designer since 2021. I'm passionate about using technology to solve problems and create beautifully designed experiences.

I worked as a Flutter developer at TeklifimGelsin, where I built a mobile app that received \$14 million in investment.
    
I currently work as a freelance Flutter developer and UI/UX designer. my most recent work is Decision AI, which uses Artificial Intelligence to help users make better decisions in various situations.
    
I am also a big fan of technology and cars, I love to learn about new trends. My favorite color is purple :)
    
I am always looking for new opportunities to use my skills and knowledge to make a difference. If you're interested in working with me, please don't hesitate to contact me.
    
I'm excited to see what the future holds for me. I'm confident that I can use my skills and knowledge to make a positive impact on the world.
        
        """),
            ).linearGradient(
              [
                Colors.black,
                Colors.black,
                Colors.black,
                Colors.black,
                Colors.black,
                Colors.transparent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).constrainedBox(
              BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height - 380),
            ),
          ],
        )
            .pad16()
            .customCard(borderRadius: 32, blur: 0)
            .maxDesktopWidth()
            .pad16(vertical: false),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: icons
                .map(
                  (e) => Image.asset(
                    "assets/images/icons/socials/${e.imagePath}.webp",
                    height: 32,
                    width: 32,
                    color: Theme.of(context).colorScheme.primary,
                  )
                      .centerWidget()
                      .squareBox(48)
                      .inkwell(() => launchUrl(Uri.parse(e.redirectionUrl)))
                      .card(
                        margin: EdgeInsets.zero,
                        color: Colors.transparent,
                      ),
                )
                .toList(),
          ),
        ),
        Text(
          "Powered by Flutter",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary),
        ).padOnly(top: 16)
      ],
    );
  }
}

class SocialIcon {
  final String imagePath;
  final String redirectionUrl;
  final double? dimensions;
  final Color? color;

  SocialIcon({
    required this.imagePath,
    required this.redirectionUrl,
    this.dimensions,
    this.color,
  });
}
