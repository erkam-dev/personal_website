import 'package:dartz/dartz.dart';

import '../../../../../../core/core.dart';
import '../../youtube.dart';

abstract class YoutubeRepository {
  Future<Either<Failure, List<String>>> getPlaylists();
  Future<Either<Failure, List<YoutubeVideo>>> getPlaylistItems(
      String playlistId);
}
