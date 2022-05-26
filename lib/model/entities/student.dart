import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:meet_u/model/entities/career.dart';
import 'package:meet_u/model/entities/chat/group_chat.dart';
import 'package:meet_u/model/entities/chat/message.dart';
import 'package:meet_u/model/entities/gender.dart';
import 'package:meet_u/model/entities/post.dart';
import 'package:meet_u/model/entities/studentxgroup.dart';
import 'package:meet_u/model/entities/support_message.dart';
import '../../external_services/database.dart';
import 'chat/chat.dart';
import 'event.dart';
import 'meet_u_user.dart';
part 'student.g.dart';


@JsonSerializable(explicitToJson: true)
class Student extends MeetU_User{

  @JsonKey(name: 'name')
  late String name;
  @JsonKey(name: 'lastName')
  late String lastName;
  @JsonKey(name: 'gender')
  late Gender gender;
  @JsonKey(name: 'friends')
  List<String>? friends;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'image')
  String? imagePath;
  @JsonKey(name: 'hobbiesPicturesUrls')
  List<String>? hobbiesPicturesUrls;
  @JsonKey(name: 'career')
  Career? career;
  @JsonKey(ignore: true)
  List<SupportMessage>? supportMessages;
  @JsonKey(ignore: true)
  List<Chat>? chats;
  @JsonKey(ignore: true)
  List<StudentxGroup>? groups;
  @JsonKey(ignore: true)
  List<Post>? posts;
  @JsonKey(ignore: true)
  List<Event>? events;


  Student( ) : super(false);

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);


  @override
  login() {
  }

  @override
  signOut() {
  }


  initMainInfo(String email,String name, String lastName,String id,Career career,Gender gender){
    this.email=email;
    this.name=name;
    this.lastName=lastName;
    hobbiesPicturesUrls=null;
    description=null;
    imagePath = null;
    this.id=id;
    this.career=career;
    this.gender=gender;
  }


   finishSignUp()async{
    Database _database= Database();
    _database.addStudent(this);
  }

  
  sendGroupMessage(String message,GroupChat groupChat)async{
    Database _database= Database();
    Message newMessage=Message(id!, DateTime.now(), message);
    groupChat.messages ??= [];
    groupChat.messages!.add(newMessage);
    _database.addGroupMessage(groupChat);
  }

  addPost(String groupid, String description, File? file, List<String>? tags)async{
    Post post = Post(id!, groupid, description, "vacio", DateTime.now(), tags);
    Database _database= Database();
    await _database.addPost(post);
  }

  joinGroup(String groupId)async{
    Database _database= Database();
    StudentxGroup studentxGroup=StudentxGroup(id!, groupId);
    await _database.addStudentxGroup(studentxGroup);
  }

  addEvent(String groupid, String description, String place, DateTime date)async{
    Database _database= Database();
    Event event= Event(id!, groupid, null, date, description, place);
    await _database.addEvent(event);
  }

}
