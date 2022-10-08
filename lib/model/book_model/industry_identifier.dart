import 'package:json_annotation/json_annotation.dart';

part 'industry_identifier.g.dart';

@JsonSerializable()
class IndustryIdentifier {
  String? type;
  String? identifier;

  IndustryIdentifier({this.type, this.identifier});

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) {
    return _$IndustryIdentifierFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IndustryIdentifierToJson(this);
}
