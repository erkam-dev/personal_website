import '../../medium.dart';

class MediumModel extends Medium {
  const MediumModel({required super.value, required super.valueList});
  factory MediumModel.fromJson(
      Map<String, dynamic> json, num amount, num maturity) {
    List values = json['value_list'] ?? [];
    List valuesList = values.map((i) => MediumItemModel.fromJson(i)).toList();
    return MediumModel(
      value: json["value"],
      valueList: valuesList,
    );
  }
}
