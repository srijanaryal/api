import 'package:json_annotation/json_annotation.dart';

part 'dog_container.g.dart'; // This will be generated by the build_runner

@JsonSerializable()
class DogContainer {
  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'status')
  String status;

  DogContainer({
    required this.message,
    required this.status,
  });

  factory DogContainer.fromJson(Map<String, dynamic> json) =>
      _$DogContainerFromJson(json);
  Map<String, dynamic> toJson() => _$DogContainerToJson(this);
}
