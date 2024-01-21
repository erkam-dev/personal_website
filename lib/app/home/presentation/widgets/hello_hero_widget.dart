import 'package:flutter/material.dart';
import 'package:personal_website/core/core.dart';
import 'package:personal_website/core/extensions/layout_extension.dart';

class HelloHeroWidget extends StatelessWidget {
  final Function()? onPressed;
  const HelloHeroWidget({super.key, required this.onPressed});

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
                  .displayMedium!
                  .copyWith(color: Colors.white),
            ),
            Text(
              "I’m Erkam",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 10,
            ),
            ElevatedButton.icon(
                onPressed: onPressed,
                icon: const Icon(Icons.arrow_downward_rounded),
                label: Text(
                  "Explore",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ))
          ],
        ),
        Image.asset("assets/images/pp.png", scale: 2),
      ],
    ).pad32().maxDesktopWidth();
  }
}
