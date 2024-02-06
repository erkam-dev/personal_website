import 'package:flutter/material.dart';

import '../../../../lib.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xFF86a1ff), Color(0xFFaf89ff)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
        ),
        CustomScaffold(
          title: "Title of Example",
          body: ListView(
            children: const [],
          ),
        )
      ],
    );
  }
}
