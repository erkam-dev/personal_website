// ignore: must_be_immutable
import '../../example.dart';

class ExampleItemModel extends ExampleItem {
  const ExampleItemModel({required super.value});
  factory ExampleItemModel.fromJson(Map<String, dynamic> json) {
    return ExampleItemModel(value: json["bank_id"]);
  }
  factory ExampleItemModel.fromJsonRecommendedItems(Map<String, dynamic> json) {
    return ExampleItemModel(value: json['value']);
  }
}
