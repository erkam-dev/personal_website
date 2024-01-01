part of 'medium_bloc.dart';

abstract class MediumEvent extends Equatable {
  const MediumEvent();

  @override
  List<Object> get props => [];
}

class CreateMediumPost extends MediumEvent {
  final num? amount;
  final num? maturity;

  const CreateMediumPost({this.amount, this.maturity});
}

class GetRecommendedMediumItems extends MediumEvent {
  final List itemPayloadList;
  const GetRecommendedMediumItems({required this.itemPayloadList});
  @override
  List<Object> get props => [itemPayloadList];
}

// ignore: must_be_immutable
class ApplyMediumItem extends MediumEvent {
  final MediumItem item;
  bool? isSponsored;
  ApplyMediumItem({required this.item, this.isSponsored});
  @override
  List<Object> get props => [item];
}
