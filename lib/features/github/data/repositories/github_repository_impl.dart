import 'package:dartz/dartz.dart';
import 'package:personal_website/features/features.dart';

import '../../../../core/core.dart';

class GithubRepositoryImpl extends GithubRepository {
  final GithubRemoteDataSource remoteDataSource;
  ServerFailure serverFailure = ServerFailure();

  GithubRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, String>> getRawRepoFile(String filePath) async {
    try {
      final response = await remoteDataSource.getRawRepoFile(filePath);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
