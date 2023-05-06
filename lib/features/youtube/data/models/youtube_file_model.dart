// ignore: must_be_immutable

import '../../youtube.dart';

class YoutubeFileModel extends YoutubeFile {
  const YoutubeFileModel({
    required super.key,
    required super.name,
    required super.thumbnailUrl,
    required super.lastModified,
  });
  factory YoutubeFileModel.fromJson(Map<String, dynamic> json) {
    return YoutubeFileModel(
      key: json['key'],
      name: json['name'],
      thumbnailUrl: json['thumbnail_url'],
      lastModified: DateTime.parse(json['last_modified']),
    );
  }
}
