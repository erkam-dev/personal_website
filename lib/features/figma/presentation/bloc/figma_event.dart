part of 'figma_bloc.dart';

abstract class FigmaEvent extends Equatable {
  const FigmaEvent();

  @override
  List<Object> get props => [];
}

class GetCommunityFiles extends FigmaEvent {}
