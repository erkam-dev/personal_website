import 'package:dartz/dartz.dart';

import '../../../../../../core/core.dart';

abstract class MediumRepository {
  Future<Either<Failure, dynamic>> applyMediumItem(int value);
}
