import 'package:json_annotation/json_annotation.dart';

part 'sale_info.g.dart';

@JsonSerializable()
class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;

  SaleInfo({this.country, this.saleability, this.isEbook});

  factory SaleInfo.fromJson(Map<String, dynamic> json) {
    return _$SaleInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SaleInfoToJson(this);
}
