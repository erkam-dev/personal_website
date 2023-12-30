import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;
  const Failure([this.properties = const <dynamic>[]]);
  @override
  List<Object?> get props => [properties];
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

//General failures
// ignore: must_be_immutable
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
