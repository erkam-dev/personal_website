import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/core.dart';
import '../../../features.dart';

class GetRawRepoFileUsecase extends Equatable
    implements UseCase<String, GetRawRepoFileParams> {
  final GithubRepository repository;

  const GetRawRepoFileUsecase(this.repository);

  @override
  Future<Either<Failure, String>> call(GetRawRepoFileParams params) async {
    return await repository.getRawRepoFile(params.filePath);
  }

  @override
  List<Object?> get props => [repository];
}

class GetRawRepoFileParams extends Equatable {
  final String filePath;

  const GetRawRepoFileParams({required this.filePath});

  @override
  List<Object?> get props => [filePath];
}
