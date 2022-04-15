import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
class Post{

  @JsonKey(name: 'student_id')
  String student_id;
  @JsonKey(name: 'group_id')
  String group_id;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'fileUrl')
  String fileUrl;
  @JsonKey(name: 'post_id')
  late String post_id;
  @JsonKey(name: 'date')
  DateTime date;
  @JsonKey(name: 'tags')
  List<String>?tags;

  Post(this.student_id, this.group_id, this.description, this.fileUrl, this.date, this.tags);


  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);


}