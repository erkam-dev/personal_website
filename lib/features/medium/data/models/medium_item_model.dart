// ignore: must_be_immutable
import '../../medium.dart';

class MediumItemModel extends MediumItem {
  const MediumItemModel({required super.value});
  factory MediumItemModel.fromJson(Map<String, dynamic> json) {
    return MediumItemModel(value: json["bank_id"]);
  }
}
