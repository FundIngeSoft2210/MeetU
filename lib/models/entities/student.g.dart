// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student()
  ..id = json['id'] as String?
  ..email = json['email'] as String?
  ..isAdmin = json['isAdmin'] as bool
  ..name = json['name'] as String
  ..lastName = json['lastName'] as String
  ..friends =
      (json['friends'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..description = json['description'] as String
  ..hobbiesPicturesUrls = (json['hobbiesPicturesUrls'] as List<dynamic>)
      .map((e) => e as String)
      .toList()
  ..career = Career.fromJson(json['career'] as Map<String, dynamic>);

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'isAdmin': instance.isAdmin,
      'name': instance.name,
      'lastName': instance.lastName,
      'friends': instance.friends,
      'description': instance.description,
      'hobbiesPicturesUrls': instance.hobbiesPicturesUrls,
      'career': instance.career.toJson(),
    };
