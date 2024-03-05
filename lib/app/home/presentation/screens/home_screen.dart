import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../lib.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showLabel = true;
  bool lastPage = false;
  PageController controller = PageController();
  List<Widget> pages = [
    const HelloHeroWidget(),
    const PortfolioWidget(),
    const ContentsWidget(),
    const AboutMeWidget()
  ];
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: PageView(
        pageSnapping: false,
        onPageChanged: (value) => setState(() {
          showLabel = value == 0;
          lastPage = value == pages.length - 1;
        }),
        controller: controller,
        scrollDirection: Axis.vertical,
        children: pages,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: lastPage
          ? null
          : ElevatedButton(
              onPressed: () => controller.nextPage(
                  duration: context.durationMilliseconds300(),
                  curve: Curves.ease),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                const Icon(Icons.arrow_downward_rounded),
                Text(
                  showLabel ? " Explore" : "",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ).animatedSize(alignment: Alignment.centerLeft),
              ]).pad4(),
            ).padOnly(bottom: 24),
    );
  }
}
