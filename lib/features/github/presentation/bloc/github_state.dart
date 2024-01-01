part of 'github_bloc.dart';

sealed class GithubState extends Equatable {
  const GithubState();
  
  @override
  List<Object> get props => [];
}

final class GithubInitial extends GithubState {}
