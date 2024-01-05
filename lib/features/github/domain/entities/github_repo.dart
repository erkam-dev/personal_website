import 'package:equatable/equatable.dart';

class GithubRepo extends Equatable {
  final String? title;
  final String? description;
  final String? thumbnailUrl;
  final String? repoName;
  final String? branch;

  const GithubRepo(
      {this.title,
      this.description,
      this.thumbnailUrl,
      this.repoName,
      this.branch});
  @override
  List<Object?> get props =>
      [title, description, thumbnailUrl, repoName, branch];
}
