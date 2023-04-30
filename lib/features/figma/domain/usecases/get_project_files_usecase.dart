import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_website/features/figma/figma.dart';

import '../../../../core/core.dart';

class GetProjectFilesUsecase extends Equatable
    implements UseCase<List<FigmaFile>, GetProjectFilesParams> {
  final FigmaRepository repository;

  const GetProjectFilesUsecase(this.repository);

  @override
  Future<Either<Failure, List<FigmaFile>>> call(
      GetProjectFilesParams params) async {
    return await repository.getProjectFiles(params.id);
  }

  @override
  List<Object?> get props => [repository];
}

class GetProjectFilesParams extends Equatable {
  final String id;

  const GetProjectFilesParams({required this.id});
  @override
  List<Object?> get props => [id];
}
