part of 'youtube_bloc.dart';

abstract class YoutubeState extends Equatable {
  const YoutubeState();

  @override
  List<Object> get props => [];
}

class YoutubeInitial extends YoutubeState {}

class YoutubeLoading extends YoutubeState {}

class YoutubeRedirection extends YoutubeState {}
