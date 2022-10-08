import 'package:json_annotation/json_annotation.dart';

part 'image_links.g.dart';

@JsonSerializable()
class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return _$ImageLinksFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImageLinksToJson(this);
}
