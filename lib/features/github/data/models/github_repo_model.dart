import 'package:personal_website/features/features.dart';

class GithubRepoModel extends GithubRepo {
  GithubRepoModel({
    required super.title,
    required super.description,
    required super.thumbnailUrl,
    required super.repoName,
    required super.branch,
  });
  factory GithubRepoModel.fromJson(Map<String, dynamic> json) {
    return GithubRepoModel(
      title: json['title'],
      description: json['description'],
      thumbnailUrl: json['thumbnail_url'],
      repoName: json['repo_name'],
      branch: json['branch'],
    );
  }
}
