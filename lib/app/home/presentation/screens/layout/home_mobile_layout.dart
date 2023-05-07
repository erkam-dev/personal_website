import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../data/data.dart';
import 'layout.dart';

// ignore: must_be_immutable
class HomeMobileLayout extends StatefulWidget {
  const HomeMobileLayout({super.key});

  @override
  State<HomeMobileLayout> createState() => _HomeMobileLayoutState();
}

class _HomeMobileLayoutState extends State<HomeMobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(() => selectedIndex = value),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.waving_hand_outlined),
            selectedIcon: Icon(Icons.waving_hand_rounded),
            label: "Hello",
          ),
          NavigationDestination(
            icon: Icon(Icons.inbox_outlined),
            selectedIcon: Icon(Icons.inbox_rounded),
            label: "Projects",
          ),
          NavigationDestination(
            icon: Icon(Icons.subscriptions_outlined),
            selectedIcon: Icon(Icons.subscriptions_rounded),
            label: "Contents",
          ),
          NavigationDestination(
            icon: Icon(Icons.face_outlined),
            selectedIcon: Icon(Icons.face_rounded),
            label: "About Me",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: themeModeSetter,
        child: ValueListenableBuilder(
          valueListenable: themeMode,
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: value == ThemeMode.dark
                ? const Icon(Icons.dark_mode_outlined)
                : value == ThemeMode.light
                    ? const Icon(Icons.light_mode_outlined)
                    : const Icon(Icons.palette_outlined),
          ),
        ),
      ),
    );
  }
}
