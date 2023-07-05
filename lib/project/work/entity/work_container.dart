import 'package:json_annotation/json_annotation.dart';

part 'work_container.g.dart';

@JsonSerializable()
class WorkContainer {
  @JsonKey(name: 'activity')
  String activity;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'participants')
  int participants;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'key')
  String key;

  @JsonKey(name: 'accessibility')
  double accessibility;

  WorkContainer({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  factory WorkContainer.fromJson(Map<String, dynamic> json) =>
      _$WorkContainerFromJson(json);

  Map<String, dynamic> toJson() => _$WorkContainerToJson(this);
}
