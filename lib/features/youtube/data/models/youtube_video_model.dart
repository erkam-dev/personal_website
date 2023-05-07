// ignore: must_be_immutable

import '../../youtube.dart';

class YoutubeVideoModel extends YoutubeVideo {
  const YoutubeVideoModel({
    required super.id,
    required super.title,
    required super.description,
    required super.thumbnailUrl,
    required super.publishedAt,
  });
  factory YoutubeVideoModel.fromJson(Map<String, dynamic> json) {
    var snippet = json['snippet'];
    var thumbnailUrl = snippet['thumbnails']['standard']['url'];
    var videoId = snippet['resourceId']['videoId'];
    return YoutubeVideoModel(
      id: videoId,
      title: snippet['title'],
      description: snippet['description'],
      thumbnailUrl: thumbnailUrl,
      publishedAt: DateTime.parse(snippet['publishedAt']),
    );
  }
}
