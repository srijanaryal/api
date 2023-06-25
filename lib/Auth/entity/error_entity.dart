import 'package:json_annotation/json_annotation.dart';
part 'error_entity.g.dart';

@JsonSerializable()
class ErrorEntity {
  ErrorEntity({
    this.rule,
    this.field,
    this.message,
  });

  @JsonKey(name: 'rule')
  final String? rule;
  @JsonKey(name: 'field')
  final String? field;
  @JsonKey(name: 'message')
  final String? message;

  factory ErrorEntity.fromJson(Map<String, dynamic> json) => _$ErrorEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorEntityToJson(this);


}
