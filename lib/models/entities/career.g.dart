// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Career _$CareerFromJson(Map<String, dynamic> json) => Career(
      json['semester'] as int,
      $enumDecode(_$CareerTypeEnumMap, json['careerType']),
    );

Map<String, dynamic> _$CareerToJson(Career instance) => <String, dynamic>{
      'semester': instance.semester,
      'careerType': _$CareerTypeEnumMap[instance.careerType],
    };

const _$CareerTypeEnumMap = {
  CareerType.ingenieria_de_sistemas: 'ingenieria_de_sistemas',
  CareerType.ingenieria_electronica: 'ingenieria_electronica',
  CareerType.ingenieria_industrial: 'ingenieria_industrial',
  CareerType.ingenieria_civil: 'ingenieria_civil',
};
