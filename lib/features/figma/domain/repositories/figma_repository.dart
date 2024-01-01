import 'package:dartz/dartz.dart';

import '../../../../../../core/core.dart';
import '../../figma.dart';

abstract class FigmaRepository {
  Future<Either<Failure, List<FigmaFile>>> getProjectFiles();
}
