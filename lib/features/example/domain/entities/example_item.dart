import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ExampleItem extends Equatable {
  final num value;

  const ExampleItem({required this.value});
  @override
  List<Object?> get props => [value];
}
