import 'package:equatable/equatable.dart';

import 'github_repo.dart';

class Github extends Equatable {
  final String username;
  final List<GithubRepo> repos;

  const Github({required this.username, required this.repos});

  @override
  List<Object?> get props => [username, repos];
}
