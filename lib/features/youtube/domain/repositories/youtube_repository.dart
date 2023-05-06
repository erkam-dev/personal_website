import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

abstract class YoutubeRepository {
  Future<Either<Failure, List<YoutubeFile>>> getChannelPlaylists();
}
