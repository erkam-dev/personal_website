import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/app/app_config.dart';
import 'package:personal_website/core/constants/layout_breakpoints.dart';

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
    GithubBloc githubBloc = BlocProvider.of<GithubBloc>(context);
    Future.microtask(() => {
          figmaBloc.add(GetProjectFiles()),
          youtubeBloc.add(GetVideos()),
          githubBloc.add(GetRepos()),
        });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.biggest.width > mobileBp
            ? const HomeDesktopLayout()
            : const HomeMobileLayout();
      },
    );
  }
}
