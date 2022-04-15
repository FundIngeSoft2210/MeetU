// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      json['student_id'] as String,
      json['group_id'] as String,
      json['description'] as String,
      json['fileUrl'] as String,
      DateTime.parse(json['date'] as String),
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    )..post_id = json['post_id'] as String;

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'student_id': instance.student_id,
      'group_id': instance.group_id,
      'description': instance.description,
      'fileUrl': instance.fileUrl,
      'post_id': instance.post_id,
      'date': instance.date.toIso8601String(),
      'tags': instance.tags,
    };
