import 'package:json_annotation/json_annotation.dart';
import 'package:meet_u/external_services/database.dart';
import 'package:meet_u/model/entities/chat/group_chat.dart';
import 'package:meet_u/model/entities/group.dart';
import 'package:meet_u/model/entities/meet_u_user.dart';
part 'admin.g.dart';


@JsonSerializable(explicitToJson: true)

class Admin extends MeetU_User{

  Admin() : super(true);

  factory Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);
  Map<String, dynamic> toJson() => _$AdminToJson(this);



  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }



  addGroup(Group group)async{
    Database database=Database();
    String groupId=await database.addGroup(group);
    await addGroupChat(groupId);
  }


  addGroupChat(String groupId)async{
    Database database=Database();
    await database.addGroupChat(GroupChat(groupId));
  }





}