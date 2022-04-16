import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meet_u/model/entities/chat/group_chat.dart';
import 'package:meet_u/model/entities/chat/message.dart';
import 'package:meet_u/model/entities/chat_type.dart';
import 'package:meet_u/model/entities/group.dart';
import 'package:meet_u/model/entities/student.dart';

class Database{


  final users = FirebaseFirestore.instance.collection('users');
  final groups = FirebaseFirestore.instance.collection('groups');
  final chats = FirebaseFirestore.instance.collection('chats');
  final studentxgroup = FirebaseFirestore.instance.collection('studentxgroup');


  //READ
  Stream<DocumentSnapshot<Map<String, dynamic>>> currentUser(String userId){
    return users.doc(userId).snapshots();
  }


  Stream<QuerySnapshot<Map<String, dynamic>>> getStudentGroups(String studentId){
    return studentxgroup.where("student_id",isEqualTo: studentId).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getGroupChat(String groupId){
    return chats.where("chatType",isEqualTo: ChatType.group.name).where("group_id",isEqualTo: groupId).snapshots();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getGroup(String groupId){
    return groups.doc(groupId).get();
  }


  //CREATE
  Future<bool> addStudent(Student student) async{
    try {
      await users.doc(student.id).set(student.toJson());
      return true;
    } catch (e) {
      return Future.error(e); // return error
    }
  }


  Future<String> addGroup(Group group) async{
    try {
      DocumentReference reference= groups.doc();
      group.id=reference.id;
      await reference.set(group.toJson());
      return reference.id;
    } catch (e) {
      return Future.error(e); // return error
    }
  }


  Future<bool> addGroupChat(GroupChat groupChat) async{
    try {
      DocumentReference reference= chats.doc();
      groupChat.id=reference.id;
      await reference.set(groupChat.toJson());
      return true;
    } catch (e) {
      return Future.error(e); // return error
    }
  }




  Future<bool> addGroupMessage(GroupChat groupChat) async{
    try {
      await chats.doc(groupChat.id).update(groupChat.toJson());
      return true;
    } catch (e) {
      return Future.error(e); // return error
    }
  }

}


