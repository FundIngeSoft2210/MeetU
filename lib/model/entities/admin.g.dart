// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admin _$AdminFromJson(Map<String, dynamic> json) => Admin()
  ..id = json['id'] as String?
  ..email = json['email'] as String?
  ..isAdmin = json['isAdmin'] as bool;

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'isAdmin': instance.isAdmin,
    };
