import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/app/app_config.dart';
import 'package:personal_website/core/core.dart';

import '../../../../features/features.dart';
import '../../home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final globalContext = NavigationService.navigatorKey.currentContext!;

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController();
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
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const SizedBox().blurBackground(16),
            actions: [
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  "Contact Me",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ).colorFiltered(Colors.white).padOnly(right: 8)
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          body: PageView(
            controller: controller,
            scrollDirection: Axis.vertical,
            children: [
              HelloHeroWidget(
                  onPressed: () => controller.nextPage(
                      duration: context.durationMilliseconds300(),
                      curve: Curves.ease)),
              const FigmaDesignsSectionWidget(),
              const YoutubeVideosSectionWidget(),
              const GithubReposSectionWidget(),
            ],
          ),
        )
      ],
    );
  }
}
