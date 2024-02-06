import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/app/home/home.dart';
import 'package:personal_website/core/core.dart';
import 'package:personal_website/core/extensions/layout_extension.dart';
import 'package:personal_website/features/features.dart';

class ContentsWidget extends StatefulWidget {
  const ContentsWidget({super.key});

  @override
  State<ContentsWidget> createState() => _ContentsWidgetState();
}

class _ContentsWidgetState extends State<ContentsWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;
  List tabs = ["Videos", "Designs", "Repos"];
  List<List<Widget>> tabViews = [];
  @override
  void initState() {
    YoutubeBloc youtubeBloc = BlocProvider.of<YoutubeBloc>(context);
    FigmaBloc figmaBloc = BlocProvider.of<FigmaBloc>(context);
    GithubBloc githubBloc = BlocProvider.of<GithubBloc>(context);
    tabController =
        TabController(length: tabs.length, vsync: this, initialIndex: 0);
    tabViews = [
      youtubeBloc.youtubeVideos
          .map(
            (e) => ContentItemWidget(
              imagePath: "https://i3.ytimg.com/vi/${e.id}/maxresdefault.jpg",
              title: e.title,
              description: e.description,
            ),
          )
          .toList(),
      figmaBloc.projectFiles
          .map((e) => ContentItemWidget(
              imagePath: e.thumbnailUrl, title: e.name, description: ""))
          .toList(),
      githubBloc.github.repos
          .map((e) => ContentItemWidget(
              imagePath: "${e.thumbnailUrl}",
              title: "${e.title}",
              description: "${e.repoName} | ${e.branch}"))
          .toList(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Contents",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
        Card(
          color: Colors.white24,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side:
                BorderSide(color: Theme.of(context).colorScheme.surfaceVariant),
            borderRadius: context.borderRadius32(),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TabBar(
                    controller: tabController,
                    tabs: tabs
                        .map((e) => Tab(
                              text: e,
                              iconMargin: context.edgeInsets(0),
                              height: 30,
                            ))
                        .toList(),
                    isScrollable: true,
                    splashBorderRadius: context.borderRadius32(),
                    onTap: (value) => setState(() => selectedIndex = value),
                  ).pad16(),
                  TabBarView(
                          viewportFraction: 0.99,
                          controller: tabController,
                          children: tabViews
                              .map((e) => SingleChildScrollView(
                                    child: Wrap(
                                      runAlignment: WrapAlignment.center,
                                      alignment: WrapAlignment.center,
                                      spacing: 0,
                                      runSpacing: 8,
                                      children: e,
                                    ),
                                  ))
                              .toList())
                      .sizedBox(height: MediaQuery.sizeOf(context).height - 400)
                      .maxDesktopWidth(),
                ],
              ),
              Positioned(
                bottom: 20,
                child: FilledButton.icon(
                  onPressed: () {},
                  label: const Text("See More"),
                  icon: const Icon(Icons.view_carousel_rounded),
                ),
              )
            ],
          ),
        ).maxDesktopWidth().pad16(vertical: false),
      ],
    );
  }
}
