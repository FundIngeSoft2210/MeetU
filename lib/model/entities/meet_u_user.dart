import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
abstract class MeetU_User{

  String? id;
  String? email;
  @JsonKey(ignore: true)
  String? password;
  bool isAdmin;

  MeetU_User(this.isAdmin);

  login();
  signOut();



}