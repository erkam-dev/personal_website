part of 'example_bloc.dart';

abstract class ExampleState extends Equatable {
  const ExampleState();

  @override
  List<Object> get props => [];
}

class ExampleInitial extends ExampleState {}

class ExampleLoading extends ExampleState {}

class RecommendedExampleLoading extends ExampleState {}

class ExampleResults extends ExampleState {}

class ExampleRedirection extends ExampleState {
  final ExampleItem item;
  const ExampleRedirection(this.item);
  @override
  List<Object> get props => [item];
}
