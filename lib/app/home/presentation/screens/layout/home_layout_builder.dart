import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/app/app_config.dart';

import '../../../../../features/features.dart';
import '../../../home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final globalContext = NavigationService.navigatorKey.currentContext!;
int selectedIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    FigmaBloc figmaBloc = BlocProvider.of<FigmaBloc>(context);
    YoutubeBloc youtubeBloc = BlocProvider.of<YoutubeBloc>(context);
    figmaBloc.add(GetProjectFiles());
    youtubeBloc.add(GetPlaylists());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.biggest.width > 600
            ? const HomeDesktopLayout()
            : const HomeMobileLayout();
      },
    );
  }
}
