import 'package:flutter/material.dart';

class HelloHeroWidget extends StatelessWidget {
  const HelloHeroWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      title: Text(
        "Hi, I’m Erkam. Welcome!",
        style: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
      leading: Image.asset("assets/images/pp.png", scale: 10),
    );
  }
}
