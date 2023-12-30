part of 'example_bloc.dart';

abstract class ExampleEvent extends Equatable {
  const ExampleEvent();

  @override
  List<Object> get props => [];
}

class CreateExamplePost extends ExampleEvent {
  final num? amount;
  final num? maturity;

  const CreateExamplePost({this.amount, this.maturity});
}

class GetRecommendedExampleItems extends ExampleEvent {
  final List itemPayloadList;
  const GetRecommendedExampleItems({required this.itemPayloadList});
  @override
  List<Object> get props => [itemPayloadList];
}

// ignore: must_be_immutable
class ApplyExampleItem extends ExampleEvent {
  final ExampleItem item;
  bool? isSponsored;
  ApplyExampleItem({required this.item, this.isSponsored});
  @override
  List<Object> get props => [item];
}
