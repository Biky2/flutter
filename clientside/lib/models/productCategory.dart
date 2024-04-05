import 'package:json_annotation/json_annotation.dart';
part 'productCategory.g.dart';

///name must be same as main

@JsonSerializable()
class Productcategory {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "categoryname")
  String? categoryname;

  Productcategory({
    this.id,
    this.categoryname,
  });

  factory Productcategory.fromJson(Map<String, dynamic> json) =>
      _$ProductcategoryFromJson(json);
  Map<String, dynamic> toJson() => _$ProductcategoryToJson(this);
}
