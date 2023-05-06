import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../youtube.dart';

class YoutubeRepositoryImpl extends YoutubeRepository {
  final YoutubeRemoteDataSource remoteDataSource;
  ServerFailure serverFailure = ServerFailure();

  YoutubeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<YoutubeFile>>> getChannelPlaylists() async {
    try {
      final response = await remoteDataSource.getProjectFiles();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
