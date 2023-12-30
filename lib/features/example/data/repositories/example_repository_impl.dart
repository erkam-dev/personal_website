import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../example.dart';

class ExampleRepositoryImpl extends ExampleRepository {
  final ExampleRemoteDataSource remoteDataSource;
  ServerFailure serverFailure = ServerFailure();

  ExampleRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, dynamic>> applyExampleItem(int value) async {
    try {
      final response = await remoteDataSource.applyExampleItem(value);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
