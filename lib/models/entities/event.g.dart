// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      json['author_id'] as String,
      json['group_id'] as String,
      (json['participants'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      DateTime.parse(json['date'] as String),
      json['description'] as String,
      json['place'] as String,
    )..id = json['id'] as String;

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'author_id': instance.author_id,
      'group_id': instance.group_id,
      'participants': instance.participants,
      'date': instance.date.toIso8601String(),
      'description': instance.description,
      'place': instance.place,
      'id': instance.id,
    };
