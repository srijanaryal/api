// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorEntity _$ErrorEntityFromJson(Map<String, dynamic> json) => ErrorEntity(
      rule: json['rule'] as String?,
      field: json['field'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorEntityToJson(ErrorEntity instance) =>
    <String, dynamic>{
      'rule': instance.rule,
      'field': instance.field,
      'message': instance.message,
    };
