import 'package:json_annotation/json_annotation.dart';

import 'epub.dart';
import 'pdf.dart';

part 'access_info.g.dart';

@JsonSerializable()
class AccessInfo {
  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  Epub? epub;
  Pdf? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) {
    return _$AccessInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccessInfoToJson(this);
}
