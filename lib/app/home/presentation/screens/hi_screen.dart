import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/figma/figma.dart';
import '../../home.dart';

class HiScreen extends StatefulWidget {
  const HiScreen({super.key});

  @override
  State<HiScreen> createState() => _HiScreenState();
}

class _HiScreenState extends State<HiScreen> {
  @override
  void initState() {
    super.initState();
    FigmaBloc figmaBloc = BlocProvider.of<FigmaBloc>(context);
    figmaBloc.add(GetProjectFiles());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, c) => Center(
        child: SizedBox(
          width: c.biggest.width > 1200 ? 1200 : null,
          child: ListView(
            children: const [
              HelloHeroWidget(),
              FigmaDesignsSectionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
