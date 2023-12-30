import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/core.dart';
import '../../figma.dart';

class GetProjectFilesUsecase extends Equatable
    implements UseCase<List<FigmaFile>, NoParams> {
  final FigmaRepository repository;

  const GetProjectFilesUsecase(this.repository);

  @override
  Future<Either<Failure, List<FigmaFile>>> call(NoParams params) async {
    return await repository.getProjectFiles();
  }

  @override
  List<Object?> get props => [repository];
}
