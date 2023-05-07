import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class GetPlaylistItemsUsecase extends Equatable
    implements UseCase<List<YoutubeVideo>, GetPlaylistItemsParams> {
  final YoutubeRepository repository;

  const GetPlaylistItemsUsecase(this.repository);

  @override
  Future<Either<Failure, List<YoutubeVideo>>> call(
      GetPlaylistItemsParams params) async {
    return await repository.getPlaylistItems(params.playlistId);
  }

  @override
  List<Object?> get props => [repository];
}

class GetPlaylistItemsParams extends Equatable {
  final String playlistId;

  const GetPlaylistItemsParams({required this.playlistId});
  @override
  List<Object?> get props => [playlistId];
}
