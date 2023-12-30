import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/core.dart';
import '../domain.dart';

class GetPlaylistsUsecase extends Equatable
    implements UseCase<List<String>, NoParams> {
  final YoutubeRepository repository;

  const GetPlaylistsUsecase(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) async {
    return await repository.getPlaylists();
  }

  @override
  List<Object?> get props => [repository];
}
