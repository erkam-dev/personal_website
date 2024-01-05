import 'package:personal_website/features/features.dart';

class GithubModel extends Github {
  const GithubModel({required super.username, required super.repos});
  factory GithubModel.fromJson(Map<String, dynamic> json) {
    List repoData = json['repos'] ?? [];
    List<GithubRepo> repos =
        repoData.map((e) => GithubRepoModel.fromJson(e)).toList();
    return GithubModel(username: json['username'], repos: repos);
  }
}
