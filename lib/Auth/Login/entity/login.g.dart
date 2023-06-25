// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      accessToken: json['accessToken'] as String?,
      expiresIn: json['expiresIn'] as int?,
      refreshToken: json['refreshToken'] as String?,
      refreshTokenExpiresIn: json['refreshTokenExpiresIn'] as int?,
    )..issuedTime = json['issuedTime'] as int?;

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'expiresIn': instance.expiresIn,
      'refreshToken': instance.refreshToken,
      'refreshTokenExpiresIn': instance.refreshTokenExpiresIn,
      'issuedTime': instance.issuedTime,
    };
