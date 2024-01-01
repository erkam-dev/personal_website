import 'package:dartz/dartz.dart';

import '../../../../../../core/core.dart';
import '../../youtube.dart';

class YoutubeRepositoryImpl extends YoutubeRepository {
  final YoutubeRemoteDataSource remoteDataSource;
  ServerFailure serverFailure = ServerFailure();

  YoutubeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<YoutubeVideo>>> getPlaylistItems(
      String playlistId) async {
    try {
      final response = await remoteDataSource.getPlaylistItems(playlistId);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getPlaylists() async {
    try {
      final response = await remoteDataSource.getPlaylists();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
