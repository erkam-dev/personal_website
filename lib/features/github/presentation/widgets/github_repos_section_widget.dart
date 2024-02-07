import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/core/core.dart';
import 'package:personal_website/features/features.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubReposSectionWidget extends StatelessWidget {
  const GithubReposSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GithubBloc githubBloc = BlocProvider.of<GithubBloc>(context);
    return BlocBuilder(
      bloc: githubBloc,
      builder: (context, state) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () =>
                launchUrl(Uri.parse('https://www.github.com/erkam-dev')),
            title: Text("Github Repos",
                style: Theme.of(context).textTheme.titleLarge),
            trailing: const Icon(Icons.navigate_next_rounded),
          ).pad32(vertical: false),
          (state.runtimeType == GithubLoading)
              ? const Center(child: CircularProgressIndicator())
                  .squareBox(30)
                  .pad16()
              : ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemExtent: 300,
                  children: githubBloc.github.repos.map((e) {
                    openRepoDetail() => Navigator.push(
                        context,
                        HeroDialogRoute(
                            fullscreenDialog: true,
                            builder: (context) => BlocProvider.value(
                                value: githubBloc,
                                child:
                                    GithubRepoDetailsScreen(githubRepo: e))));
                    return Hero(
                      tag: e,
                      child: Card(
                        child: InkWell(
                          onTap: openRepoDetail,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Card(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant,
                                  child: Image.network(
                                    e.thumbnailUrl ?? "",
                                    width: 300,
                                    height: 175,
                                  )),
                              ListTile(
                                title: Text(
                                  (e.title ?? ""),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                dense: true,
                                trailing: OutlinedButton(
                                  onPressed: () => launchUrl(Uri.parse(
                                      "https://www.github.com/${githubBloc.github.username}/${e.repoName}")),
                                  child: const Icon(Icons.open_in_new_rounded),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ).sizedBox(height: 240),
        ],
      ).maxDesktopWidth(),
    );
  }
}
