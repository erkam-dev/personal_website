import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/core/core.dart';
import 'package:personal_website/features/youtube/youtube.dart';

part 'youtube_event.dart';
part 'youtube_state.dart';

class YoutubeBloc extends Bloc<YoutubeEvent, YoutubeState> {
  List<YoutubeFile> projectFiles;
  final GetChannelPlaylistsUsecase getChannelPlaylistsUsecase;

  YoutubeBloc({
    required this.projectFiles,
    required this.getChannelPlaylistsUsecase,
  }) : super(YoutubeInitial()) {
    on<GetProjectFiles>((event, emit) async {
      emit(YoutubeLoading());
      final failureOrValue = await getChannelPlaylistsUsecase(NoParams());
      failureOrValue.fold(
        (failure) => emit(YoutubeInitial()),
        (value) {
          projectFiles = value;
          emit(YoutubeRedirection());
          emit(YoutubeInitial());
        },
      );
    });
  }
}
