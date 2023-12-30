// ignore: must_be_immutable

import '../../youtube.dart';

class YoutubeVideoModel extends YoutubeVideo {
  const YoutubeVideoModel({
    required super.id,
    required super.title,
    required super.description,
    required super.publishedAt,
  });
  factory YoutubeVideoModel.fromJson(Map<String, dynamic> json) {
    return YoutubeVideoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      publishedAt: DateTime.parse(json['published_at']),
    );
  }
}
