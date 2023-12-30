import 'package:dartz/dartz.dart';

import '../../../../../../core/core.dart';
import '../../medium.dart';

class MediumRepositoryImpl extends MediumRepository {
  final MediumRemoteDataSource remoteDataSource;
  ServerFailure serverFailure = ServerFailure();

  MediumRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, dynamic>> applyMediumItem(int value) async {
    try {
      final response = await remoteDataSource.applyMediumItem(value);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
