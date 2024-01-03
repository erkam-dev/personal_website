part of 'github_bloc.dart';

sealed class GithubEvent extends Equatable {
  const GithubEvent();

  @override
  List<Object> get props => [];
}

class GetRawRepoFile extends GithubEvent {
  final String repoName;
  final String branchName;

  GetRawRepoFile({required this.repoName, required this.branchName});

  @override
  List<Object> get props => [repoName, branchName];
}

class GetRepos extends GithubEvent {}
