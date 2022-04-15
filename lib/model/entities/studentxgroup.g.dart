// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentxgroup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentxGroup _$StudentxGroupFromJson(Map<String, dynamic> json) =>
    StudentxGroup(
      json['student_id'] as String,
      json['group_id'] as String,
    )..id = json['id'] as String;

Map<String, dynamic> _$StudentxGroupToJson(StudentxGroup instance) =>
    <String, dynamic>{
      'student_id': instance.student_id,
      'group_id': instance.group_id,
      'id': instance.id,
    };
