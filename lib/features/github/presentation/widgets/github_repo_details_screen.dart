import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:personal_website/core/core.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../github.dart';

class GithubRepoDetailsScreen extends StatefulWidget {
  final GithubRepo githubRepo;
  const GithubRepoDetailsScreen({super.key, required this.githubRepo});

  @override
  State<GithubRepoDetailsScreen> createState() =>
      _GithubRepoDetailsScreenState();
}

class _GithubRepoDetailsScreenState extends State<GithubRepoDetailsScreen> {
  @override
  void initState() {
    GithubBloc githubBloc = BlocProvider.of<GithubBloc>(context);
    githubBloc.add(GetRawReadmeFile(githubRepo: widget.githubRepo));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GithubBloc githubBloc = BlocProvider.of<GithubBloc>(context);
    return LayoutBuilder(
      builder: (context, c) => Align(
        alignment: Alignment.center,
        child: Padding(
          padding: c.biggest.width < mobileBp
              ? EdgeInsets.zero
              : const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Hero(
            tag: widget.githubRepo,
            child: Card(
              margin: EdgeInsets.zero,
              shape: c.biggest.width < mobileBp
                  ? const RoundedRectangleBorder()
                  : null,
              child: ConstrainedBox(
                constraints: c.biggest.width < mobileBp
                    ? const BoxConstraints()
                    : const BoxConstraints(
                        maxHeight: 1000,
                        minHeight: 300,
                        maxWidth: 1000,
                        minWidth: 500,
                      ),
                child: Scaffold(
                  appBar: AppBar(
                    title: Text((widget.githubRepo.title ?? "")),
                    actions: [
                      OutlinedButton.icon(
                        onPressed: () => launchUrl(Uri.parse(
                            "https://www.github.com/${githubBloc.github.username}/${widget.githubRepo.repoName}")),
                        icon: const Icon(Icons.open_in_new_rounded),
                        label: const Text("Open in new tab"),
                      ).padOnly(right: 16)
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                        // TODO: convert markdown widget to extension.
                        // TODO: add ImageNetwork widget to Markdown Extension
                        child: Markdown(data: githubBloc.readmeContent ?? "")),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
