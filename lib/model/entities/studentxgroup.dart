import 'package:json_annotation/json_annotation.dart';
part 'studentxgroup.g.dart';


@JsonSerializable(explicitToJson: true)

class StudentxGroup{

  @JsonKey(name: 'student_id')
  String student_id;
  @JsonKey(name: 'group_id')
  String group_id;
  @JsonKey(name: 'id')
  late String id;

  StudentxGroup(this.student_id, this.group_id);

  factory StudentxGroup.fromJson(Map<String, dynamic> json) => _$StudentxGroupFromJson(json);
  Map<String, dynamic> toJson() => _$StudentxGroupToJson(this);

}
