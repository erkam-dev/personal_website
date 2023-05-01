import 'package:dartz/dartz.dart';
import 'package:personal_website/features/figma/figma.dart';

import '../../../../core/core.dart';

abstract class FigmaRepository {
  Future<Either<Failure, List<FigmaFile>>> getProjectFiles();
}
