import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
  Login(
      {this.accessToken,
      this.expiresIn,
      this.refreshToken,
      this.refreshTokenExpiresIn});

  @JsonKey(name: 'accessToken')
  final String? accessToken;
  @JsonKey(name: 'expiresIn')
  final int? expiresIn;
  @JsonKey(name: 'refreshToken')
  final String? refreshToken;
  @JsonKey(name: 'refreshTokenExpiresIn')
  final int? refreshTokenExpiresIn;
  int? issuedTime;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
