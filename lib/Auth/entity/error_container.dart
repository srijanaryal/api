import 'package:flutter_learning/Auth/entity/error_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_container.g.dart';

@JsonSerializable()
class ErrorContainer {
  ErrorContainer(this.errorList);

  @JsonKey(name: 'errors')
  final List<ErrorEntity>? errorList;

  factory ErrorContainer.fromJson(Map<String, dynamic> json) =>
      _$ErrorContainerFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorContainerToJson(this);
}
