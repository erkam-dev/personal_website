part of 'github_bloc.dart';

sealed class GithubEvent extends Equatable {
  const GithubEvent();

  @override
  List<Object> get props => [];
}

class GetRawReadmeFile extends GithubEvent {
  final GithubRepo githubRepo;

  const GetRawReadmeFile({required this.githubRepo});

  @override
  List<Object> get props => [githubRepo];
}

class GetRepos extends GithubEvent {}
