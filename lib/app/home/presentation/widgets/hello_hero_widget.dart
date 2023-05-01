import 'package:flutter/material.dart';

class HelloHeroWidget extends StatelessWidget {
  const HelloHeroWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Image.asset(
            "assets/images/pp.png",
            scale: 7,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "Hi, I’m Erkam. Welcome!",
              textScaleFactor: 1.7,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
