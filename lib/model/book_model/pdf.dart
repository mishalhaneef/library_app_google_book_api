import 'package:json_annotation/json_annotation.dart';

part 'pdf.g.dart';

@JsonSerializable()
class Pdf {
  bool? isAvailable;

  Pdf({this.isAvailable});

  factory Pdf.fromJson(Map<String, dynamic> json) => _$PdfFromJson(json);

  Map<String, dynamic> toJson() => _$PdfToJson(this);
}
