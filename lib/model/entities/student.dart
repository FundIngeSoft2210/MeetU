import 'package:json_annotation/json_annotation.dart';
import 'package:meet_u/model/entities/career.dart';
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



  Student() : super(false);

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
    this.id=id;
    this.career=career;
    this.gender=gender;
  }


   finishsignUp()async{
    Database _database= Database();
    _database.addStudent(this);
  }



}
