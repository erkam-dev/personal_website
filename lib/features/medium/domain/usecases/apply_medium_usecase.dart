import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/core.dart';
import '../repositories/medium_repository.dart';

class ApplyMediumUsecase extends Equatable
    implements UseCase<dynamic, ApplyMediumParams> {
  final MediumRepository repository;

  const ApplyMediumUsecase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(ApplyMediumParams params) async {
    return await repository.applyMediumItem(params.value);
  }

  @override
  List<Object?> get props => [repository];
}

class ApplyMediumParams extends Equatable {
  final int value;

  const ApplyMediumParams({required this.value});
  @override
  List<Object?> get props => [value];
}
