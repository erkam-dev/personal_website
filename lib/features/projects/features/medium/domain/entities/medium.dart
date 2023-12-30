import 'package:equatable/equatable.dart';

class Medium extends Equatable {
  final int? value;
  final List? valueList;

  const Medium({required this.value, required this.valueList});
  @override
  List<Object?> get props => [value, valueList];
}
