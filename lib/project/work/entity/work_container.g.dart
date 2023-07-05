// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkContainer _$WorkContainerFromJson(Map<String, dynamic> json) =>
    WorkContainer(
      activity: json['activity'] as String,
      type: json['type'] as String,
      participants: json['participants'] as int,
      price: (json['price'] as num).toDouble(),
      link: json['link'] as String,
      key: json['key'] as String,
      accessibility: (json['accessibility'] as num).toDouble(),
    );

Map<String, dynamic> _$WorkContainerToJson(WorkContainer instance) =>
    <String, dynamic>{
      'activity': instance.activity,
      'type': instance.type,
      'participants': instance.participants,
      'price': instance.price,
      'link': instance.link,
      'key': instance.key,
      'accessibility': instance.accessibility,
    };
