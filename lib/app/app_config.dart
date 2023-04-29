import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/app/app.dart';
import 'package:personal_website/core/core.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeMode,
      builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const CupertinoScrollBehavior(),
        themeMode: value,
        navigatorKey: NavigationService.navigatorKey,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        home: const HomeScreen(),
      ),
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
