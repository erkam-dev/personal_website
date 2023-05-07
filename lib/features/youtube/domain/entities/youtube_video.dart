import 'package:equatable/equatable.dart';

class YoutubeVideo extends Equatable {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final DateTime publishedAt;

  const YoutubeVideo({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.publishedAt,
  });
  @override
  List<Object?> get props => [
        id,
        title,
        description,
        thumbnailUrl,
        publishedAt,
      ];
}
