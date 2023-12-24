import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/core/core.dart';

import '../../youtube.dart';

part 'youtube_event.dart';
part 'youtube_state.dart';

class YoutubeBloc extends Bloc<YoutubeEvent, YoutubeState> {
  List<YoutubeVideo> youtubeVideos;
  List<String> playlistIdList;
  final GetPlaylistItemsUsecase getPlaylistItemsUsecase;
  final GetPlaylistsUsecase getPlaylistsUsecase;

  YoutubeBloc({
    required this.youtubeVideos,
    required this.playlistIdList,
    required this.getPlaylistItemsUsecase,
    required this.getPlaylistsUsecase,
  }) : super(YoutubeInitial()) {
    on<GetPlaylists>((event, emit) async {
      emit(YoutubeLoading());
      final failureOrValue = await getPlaylistsUsecase(NoParams());
      failureOrValue.fold(
        (l) => emit(YoutubeInitial()),
        (r) {
          playlistIdList = r;
          for (var playlistId in playlistIdList) {
            add(GetPlaylistItems(playlistId: playlistId));
          }
        },
      );
    });
    on<GetPlaylistItems>((event, emit) async {
      emit(YoutubeLoading());
      final failureOrValue = await getPlaylistItemsUsecase(
          GetPlaylistItemsParams(playlistId: event.playlistId));
      failureOrValue.fold(
        (failure) => emit(YoutubeInitial()),
        (value) {
          youtubeVideos.addAll(value);
          youtubeVideos.sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
          if (event.playlistId == playlistIdList.last) {
            emit(YoutubeInitial());
          }
        },
      );
    });
    on<GetVideos>((event, emit) {
      emit(YoutubeLoading());
      Map<String, dynamic> data =
          json.decode(sl<FirebaseRemoteConfig>().getString(""));
      print(data);

      emit(YoutubeInitial());
    });
  }
}
