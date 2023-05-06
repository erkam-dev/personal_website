import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class GetChannelPlaylistsUsecase extends Equatable
    implements UseCase<List<YoutubeFile>, NoParams> {
  final YoutubeRepository repository;

  const GetChannelPlaylistsUsecase(this.repository);

  @override
  Future<Either<Failure, List<YoutubeFile>>> call(NoParams params) async {
    return await repository.getChannelPlaylists();
  }

  @override
  List<Object?> get props => [repository];
}
