import 'package:json_annotation/json_annotation.dart';

part 'epub.g.dart';

@JsonSerializable()
class Epub {
  bool? isAvailable;

  Epub({this.isAvailable});

  factory Epub.fromJson(Map<String, dynamic> json) => _$EpubFromJson(json);

  Map<String, dynamic> toJson() => _$EpubToJson(this);
}
