import 'package:json_annotation/json_annotation.dart';
import 'package:meet_u/models/entities/career.dart';
import 'package:meet_u/models/entities/meet_u_user.dart';
import 'package:meet_u/models/entities/post.dart';
import 'package:meet_u/models/entities/studentxGroup.dart';
import 'package:meet_u/models/entities/support_message.dart';

import 'chat/chat.dart';
import 'event.dart';
part 'student.g.dart';


@JsonSerializable(explicitToJson: true)
class Student extends MeetU_User{

  @JsonKey(name: 'name')
  late String name;
  @JsonKey(name: 'lastName')
  late String lastName;
  @JsonKey(name: 'friends')
  List<String>? friends;
  @JsonKey(name: 'description')
  late String description;
  @JsonKey(name: 'hobbiesPicturesUrls')
  late List<String> hobbiesPicturesUrls;
  @JsonKey(ignore: true)
  List<SupportMessage>? supportMessages;
  @JsonKey(name: 'career')
  late Career career;
  @JsonKey(ignore: true)
  List<Chat>? chats;
  @JsonKey(ignore: true)
  List<StudentxGroup>? groups;
  @JsonKey(ignore: true)
  List<Post>? posts;
  @JsonKey(ignore: true)
  List<Event>? events;



  Student() : super(false);

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);


  @override
  login() {
  }

  @override
  signOut() {
  }





}