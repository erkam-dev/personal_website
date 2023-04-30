import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../figma.dart';

class FigmaRepositoryImpl extends FigmaRepository {
  final FigmaRemoteDataSource remoteDataSource;
  ServerFailure serverFailure = ServerFailure();

  FigmaRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<FigmaFile>>> getProjectFiles(String id) async {
    try {
      final response = await remoteDataSource.getProjectFiles(id);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
