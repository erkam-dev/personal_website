import 'package:flutter/material.dart';

import '../../../../lib.dart';

class TickTodoPortfolioScreen extends StatelessWidget {
  const TickTodoPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              "https://github.com/erkam-dev/tick_to_do/assets/62347408/b32605fb-19ac-48a7-9c22-a62b92043e18",
              height: 100,
              width: 100,
            ).pad24(),
            Text(
              "Tick To Do",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
            Text(
                "Simple and elegant to-do list app. It is designed to be minimalistic and easy to use. It is a great tool to keep track of your daily tasks.",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white70,
                    )),
            const StoreDownloadButton(
              storeType: StoreType.playstore,
              redirectionUrl:
                  "https://play.google.com/store/apps/details?id=com.mehmeterkam.tick_to_do",
            ).pad16(),
            Column(
              children: [
                Text(
                  "Tick To Do Account",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "You can sign in with your Google account to backup your todos to the cloud. You can also restore your todos on any device with your Google account. If you want to delete your todos & account permanently, you can do it from the app's settings. To do that:\n 1. Open the app\n 2. Sign in to your account\n 3. Tap the profile icon on the top right\n 4. Tap the account menu\n 5. Tap the delete account button\n 6. Confirm the deletion\n 7. Done! Your account and todos are deleted permanently from cloud.\n\nNote: If you delete your account, you will lose all your todos and settings. This action is irreversible.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ).pad16().customCard(),
          ],
        ).pad16().maxDesktopWidth(),
      ),
    );
  }
}
