import 'package:equatable/equatable.dart';

class GithubRepo extends Equatable {
  final String? title;
  final String? description;
  final String? thumbnailUrl;
  final String? repoName;
  final String? branch;

  GithubRepo({
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.repoName,
    required this.branch,
  });
  @override
  List<Object?> get props => [
        title,
        description,
        thumbnailUrl,
        repoName,
        branch,
      ];
}
