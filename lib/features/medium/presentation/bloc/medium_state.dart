part of 'medium_bloc.dart';

abstract class MediumState extends Equatable {
  const MediumState();

  @override
  List<Object> get props => [];
}

class MediumInitial extends MediumState {}

class MediumLoading extends MediumState {}

class RecommendedMediumLoading extends MediumState {}

class MediumResults extends MediumState {}

class MediumRedirection extends MediumState {
  final MediumItem item;
  const MediumRedirection(this.item);
  @override
  List<Object> get props => [item];
}
