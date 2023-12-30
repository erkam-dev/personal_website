import '../../example.dart';

class ExampleModel extends Example {
  const ExampleModel({required super.value, required super.valueList});
  factory ExampleModel.fromJson(
      Map<String, dynamic> json, num amount, num maturity) {
    List values = json['value_list'] ?? [];
    List valuesList = values.map((i) => ExampleItemModel.fromJson(i)).toList();
    return ExampleModel(
      value: json["value"],
      valueList: valuesList,
    );
  }
}
