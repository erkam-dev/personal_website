import 'package:equatable/equatable.dart';

class FigmaFile extends Equatable {
  final String key;
  final String name;
  final String thumbnailUrl;
  final DateTime createdAt;
  final DateTime lastModified;
  final String description;

  const FigmaFile({
    required this.key,
    required this.name,
    required this.thumbnailUrl,
    required this.createdAt,
    required this.lastModified,
    required this.description,
  });
  @override
  List<Object?> get props =>
      [key, name, thumbnailUrl, createdAt, lastModified, description];
}
