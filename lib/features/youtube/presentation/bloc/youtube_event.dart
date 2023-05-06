part of 'youtube_bloc.dart';

abstract class YoutubeEvent extends Equatable {
  const YoutubeEvent();

  @override
  List<Object> get props => [];
}

class GetProjectFiles extends YoutubeEvent {}
