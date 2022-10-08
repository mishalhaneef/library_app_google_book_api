import 'package:json_annotation/json_annotation.dart';

part 'panelization_summary.g.dart';

@JsonSerializable()
class PanelizationSummary {
  bool? containsEpubBubbles;
  bool? containsImageBubbles;

  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) {
    return _$PanelizationSummaryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PanelizationSummaryToJson(this);
}
