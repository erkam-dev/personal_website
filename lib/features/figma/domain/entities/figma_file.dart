import 'package:equatable/equatable.dart';

class FigmaFile extends Equatable {
  final String key;
  final String name;
  final String thumbnailUrl;

  const FigmaFile({
    required this.key,
    required this.name,
    required this.thumbnailUrl,
  });
  @override
  List<Object?> get props => [key, name, thumbnailUrl];
}
