import 'package:flutter/material.dart';
import 'package:personal_website/app/home/home.dart';

import '../../../../../core/core.dart';

// ignore: must_be_immutable
class HomeDesktopLayout extends StatefulWidget {
  int selectedIndex;
  HomeDesktopLayout({super.key, required this.selectedIndex});

  @override
  State<HomeDesktopLayout> createState() => _HomeDesktopLayoutState();
}

class _HomeDesktopLayoutState extends State<HomeDesktopLayout> {
  bool isExtended = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        body: Row(
          children: [
            NavigationRail(
              labelType: NavigationRailLabelType.all,
              leading: Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 10),
                child: FilledButton(
                  onPressed: () {},
                  child: const Icon(Icons.download_outlined),
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ValueListenableBuilder(
                  valueListenable: themeMode,
                  builder: (context, value, child) => ElevatedButton(
                    onPressed: themeModeSetter,
                    child: value == ThemeMode.dark
                        ? const Icon(Icons.dark_mode_outlined)
                        : value == ThemeMode.light
                            ? const Icon(Icons.light_mode_outlined)
                            : const Icon(Icons.palette_outlined),
                  ),
                ),
              ),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.waving_hand_outlined),
                  selectedIcon: Icon(Icons.waving_hand_rounded),
                  label: Text("Hello"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.inbox_outlined),
                  selectedIcon: Icon(Icons.inbox_rounded),
                  label: Text("Projects"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.subscriptions_outlined),
                  selectedIcon: Icon(Icons.subscriptions_rounded),
                  label: Text("Contents"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.face_outlined),
                  selectedIcon: Icon(Icons.face_rounded),
                  label: Text("About Me"),
                ),
              ],
              onDestinationSelected: (value) =>
                  setState(() => widget.selectedIndex = value),
              selectedIndex: widget.selectedIndex,
            ),
            const Expanded(child: HiScreen())
          ],
        ),
      ),
    );
  }
}
