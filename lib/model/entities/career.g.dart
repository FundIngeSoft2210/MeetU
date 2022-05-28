// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Career _$CareerFromJson(Map<String, dynamic> json) => Career(
      json['semester'] as String,
      $enumDecode(_$CareerTypeEnumMap, json['careerType']),
    );

Map<String, dynamic> _$CareerToJson(Career instance) => <String, dynamic>{
      'semester': instance.semester,
      'careerType': _$CareerTypeEnumMap[instance.careerType],
    };

const _$CareerTypeEnumMap = {
  CareerType.ingenieria_de_sistemas: 'Ingeniería de Sistemas',
  CareerType.ingenieria_electronica: 'Ingeniería Electrónica',
  CareerType.ingenieria_industrial: 'Ingeniería Industrial',
  CareerType.ingenieria_civil: 'Ingeniería Civil',
};
