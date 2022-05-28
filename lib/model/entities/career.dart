import 'package:json_annotation/json_annotation.dart';
import 'package:meet_u/model/entities/career_type.dart';
part 'career.g.dart';


@JsonSerializable(explicitToJson: true)
class Career{

  @JsonKey(name: 'semester')
  String semester;
  @JsonKey(name: 'careerType')
  CareerType careerType;

  Career(this.semester, this.careerType);


  factory Career.fromJson(Map<String, dynamic> json) => _$CareerFromJson(json);
  Map<String, dynamic> toJson() => _$CareerToJson(this);

}