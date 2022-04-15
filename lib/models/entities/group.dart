import 'package:json_annotation/json_annotation.dart';
import 'package:meet_u/models/entities/chat/group_chat.dart';
import 'package:meet_u/models/entities/event.dart';
import 'package:meet_u/models/entities/post.dart';
import 'package:meet_u/models/entities/studentxGroup.dart';
part 'group.g.dart';


@JsonSerializable(explicitToJson: true)

class Group{

  @JsonKey(name: 'id')
  late String id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'imageUrl')
  String imageUrl;
  @JsonKey(name: 'members')
  @JsonKey(ignore: true)
  GroupChat groupChat;
  @JsonKey(ignore: true)
  List<StudentxGroup>? members;
  @JsonKey(ignore: true)
  List<Post>? posts;
  @JsonKey(ignore: true)
  List<Event>? events;


  Group(this.name, this.imageUrl,this.groupChat);

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);


}