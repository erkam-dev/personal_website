import 'package:flutter/material.dart';
import 'package:personal_website/app/app_config.dart';

import '../../../home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final globalContext = NavigationService.navigatorKey.currentContext!;

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.biggest.width > 600
            ? HomeDesktopLayout(selectedIndex: selectedIndex)
            : HomeMobileLayout(selectedIndex: selectedIndex);
      },
    );
  }
}
