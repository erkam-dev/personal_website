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

  YoutubeBloc({required this.youtubeVideos, required this.playlistIdList})
      : super(YoutubeInitial()) {
    on<GetVideos>((event, emit) {
      emit(YoutubeLoading());
      Map<String, dynamic> data =
          json.decode(sl<FirebaseRemoteConfig>().getString(youtubeDataKey));
      List<YoutubeVideo> videos = (data['videos'] as List)
          .map((e) => YoutubeVideoModel.fromJson(e))
          .toList();
      youtubeVideos = videos;
      emit(YoutubeInitial());
    });
  }
}
