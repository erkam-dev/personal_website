import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../repositories/example_repository.dart';

class ApplyExampleUsecase extends Equatable
    implements UseCase<dynamic, ApplyExampleParams> {
  final ExampleRepository repository;

  const ApplyExampleUsecase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(ApplyExampleParams params) async {
    return await repository.applyExampleItem(params.value);
  }

  @override
  List<Object?> get props => [repository];
}

class ApplyExampleParams extends Equatable {
  final int value;

  const ApplyExampleParams({required this.value});
  @override
  List<Object?> get props => [value];
}
