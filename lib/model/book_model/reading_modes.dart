import 'package:json_annotation/json_annotation.dart';

part 'reading_modes.g.dart';

@JsonSerializable()
class ReadingModes {
  bool? text;
  bool? image;

  ReadingModes({this.text, this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) {
    return _$ReadingModesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReadingModesToJson(this);
}
