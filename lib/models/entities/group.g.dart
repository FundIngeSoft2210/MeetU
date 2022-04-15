// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      json['name'] as String,
      json['imageUrl'] as String,
      GroupChat.fromJson(json['members'] as Map<String, dynamic>),
    )..id = json['id'] as String;

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'members': instance.groupChat.toJson(),
    };
