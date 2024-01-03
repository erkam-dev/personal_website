part of 'figma_bloc.dart';

abstract class FigmaState extends Equatable {
  const FigmaState();

  @override
  List<Object> get props => [];
}

class FigmaInitial extends FigmaState {}

class FigmaLoading extends FigmaState {}
