import 'package:json_annotation/json_annotation.dart';

part 'post_container.g.dart'; // This will be generated by the build_runner

@JsonSerializable()
class PostContainer {
  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'body')
  String body;

  PostContainer({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostContainer.fromJson(Map<String, dynamic> json) =>
      _$PostContainerFromJson(json);
  Map<String, dynamic> toJson() => _$PostContainerToJson(this);
}
