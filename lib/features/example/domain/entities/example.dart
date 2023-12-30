import 'package:equatable/equatable.dart';

class Example extends Equatable {
  final int? value;
  final List? valueList;

  const Example({required this.value, required this.valueList});
  @override
  List<Object?> get props => [value, valueList];
}
