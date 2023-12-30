import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class MediumItem extends Equatable {
  final num value;

  const MediumItem({required this.value});
  @override
  List<Object?> get props => [value];
}
