import 'package:equatable/equatable.dart';

class FigmaFile extends Equatable {
  final String key;
  final String name;
  final String thumbnailUrl;
  final DateTime lastModified;

  const FigmaFile({
    required this.key,
    required this.name,
    required this.thumbnailUrl,
    required this.lastModified,
  });
  @override
  List<Object?> get props => [key, name, thumbnailUrl, lastModified];
}
