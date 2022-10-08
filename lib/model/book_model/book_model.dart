import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  String? kind;
  int? totalItems;
  List<Item>? items;

  BookModel({this.kind, this.totalItems, this.items});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return _$BookModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}
