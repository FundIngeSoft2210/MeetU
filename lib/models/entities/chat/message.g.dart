// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      json['author_id'] as String,
      DateTime.parse(json['date'] as String),
    )..id = json['id'] as String;

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'author_id': instance.author_id,
      'date': instance.date.toIso8601String(),
      'id': instance.id,
    };
