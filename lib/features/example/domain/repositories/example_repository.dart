import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

abstract class ExampleRepository {
  Future<Either<Failure, dynamic>> applyExampleItem(int value);
}
