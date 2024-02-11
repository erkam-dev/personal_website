import 'package:flutter/material.dart';
import 'package:personal_website/core/core.dart';

class HelloHeroWidget extends StatelessWidget {
  const HelloHeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      runAlignment: WrapAlignment.center,
      verticalDirection: VerticalDirection.up,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Welcome",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.normal),
            ),
            Text(
              "I’m Erkam",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Image.asset("assets/images/pp.png", scale: 2),
      ],
    ).maxDesktopWidth().pad24();
  }
}
