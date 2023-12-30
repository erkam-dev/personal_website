import 'package:equatable/equatable.dart';

class YoutubeVideo extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime publishedAt;

  const YoutubeVideo({
    required this.id,
    required this.title,
    required this.description,
    required this.publishedAt,
  });
  @override
  List<Object?> get props => [id, title, description, publishedAt];
}
