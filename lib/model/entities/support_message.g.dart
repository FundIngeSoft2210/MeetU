// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportMessage _$SupportMessageFromJson(Map<String, dynamic> json) =>
    SupportMessage(
      json['message'] as String,
      DateTime.parse(json['date'] as String),
      json['student_id'] as String,
      json['id'] as String,
    );

Map<String, dynamic> _$SupportMessageToJson(SupportMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'date': instance.date.toIso8601String(),
      'student_id': instance.student_id,
      'id': instance.id,
    };
