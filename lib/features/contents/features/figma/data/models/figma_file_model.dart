// ignore: must_be_immutable
import '../../figma.dart';

class FigmaFileModel extends FigmaFile {
  const FigmaFileModel({
    required super.key,
    required super.name,
    required super.thumbnailUrl,
  });
  factory FigmaFileModel.fromJson(Map<String, dynamic> json) {
    return FigmaFileModel(
      key: json['key'],
      name: json['name'],
      thumbnailUrl: json['thumbnail_url'],
    );
  }
}
