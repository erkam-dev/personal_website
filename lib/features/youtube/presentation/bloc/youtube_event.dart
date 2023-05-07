part of 'youtube_bloc.dart';

abstract class YoutubeEvent extends Equatable {
  const YoutubeEvent();

  @override
  List<Object> get props => [];
}

class GetPlaylistItems extends YoutubeEvent {
  final String playlistId;

  const GetPlaylistItems({required this.playlistId});

  @override
  List<Object> get props => [playlistId];
}

class GetPlaylists extends YoutubeEvent {}
