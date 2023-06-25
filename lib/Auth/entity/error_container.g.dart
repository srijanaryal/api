// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorContainer _$ErrorContainerFromJson(Map<String, dynamic> json) =>
    ErrorContainer(
      (json['errors'] as List<dynamic>?)
          ?.map((e) => ErrorEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ErrorContainerToJson(ErrorContainer instance) =>
    <String, dynamic>{
      'errors': instance.errorList,
    };
