import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/app/app_config.dart';
import 'package:personal_website/core/core.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../features/features.dart';
import '../../home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final globalContext = NavigationService.navigatorKey.currentContext!;

class _HomeScreenState extends State<HomeScreen> {
  bool showLabel = true;
  bool lastPage = false;
  PageController controller = PageController();
  List<Widget> pages = [
    const HelloHeroWidget(),
    const ProductsWidget(),
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
                onPressed: () => launchUrl(Uri.parse("mailto:info@erkam.dev")),
                child: Text(
                  "Contact Me",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ).colorFiltered(Colors.white).padOnly(right: 8)
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          body: PageView(
            onPageChanged: (value) => setState(() =>
                {showLabel = value == 0, lastPage = value == pages.length - 1}),
            controller: controller,
            scrollDirection: Axis.vertical,
            children: pages,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
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
        )
      ],
    );
  }
}
