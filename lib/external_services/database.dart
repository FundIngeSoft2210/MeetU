import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meet_u/model/entities/chat/group_chat.dart';
import 'package:meet_u/model/entities/chat_type.dart';
import 'package:meet_u/model/entities/event.dart';
import 'package:meet_u/model/entities/group.dart';
import 'package:meet_u/model/entities/post.dart';
import 'package:meet_u/model/entities/student.dart';
import 'package:meet_u/model/entities/studentxgroup.dart';

class Database{


  final users = FirebaseFirestore.instance.collection('users');
  final groups = FirebaseFirestore.instance.collection('groups');
  final chats = FirebaseFirestore.instance.collection('chats');
  final studentxgroup = FirebaseFirestore.instance.collection('studentxgroup');
  final posts = FirebaseFirestore.instance.collection('posts');
  final events = FirebaseFirestore.instance.collection('events');


  //READ
  Stream<DocumentSnapshot<Map<String, dynamic>>> currentUser(String userId){
    return users.doc(userId).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStudentGroups(String studentId){
    return studentxgroup.where("student_id",isEqualTo: studentId).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllGroups(){
    return groups.snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getGroupPosts(String groupId){
    return posts.where("group_id",isEqualTo: groupId).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getGroupEvents(String groupId){
    return events.where("group_id",isEqualTo: groupId).snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getGroupStream(String groupId){
    return groups.doc(groupId).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStudentEvents(String studentId){
    return events.where("author_id",isEqualTo: studentId).snapshots();
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


  Future<bool> addStudentxGroup(StudentxGroup studentxGroup) async{
    try {
      DocumentReference reference= studentxgroup.doc();
      studentxGroup.id=reference.id;
      await reference.set(studentxGroup.toJson());
      return true;
    } catch (e) {
      return Future.error(e); // return error
    }
  }

  Future<bool> addPost(Post post) async{
    try {
      DocumentReference reference= posts.doc();
      post.post_id=reference.id;
      await reference.set(post.toJson());
      return true;
    } catch (e) {
      return Future.error(e); // return error
    }
  }

  Future<bool> addEvent(Event event) async{
    try {
      DocumentReference reference= events.doc();
      event.id=reference.id;
      await reference.set(event.toJson());
      return true;
    } catch (e) {
      return Future.error(e); // return error
    }
  }

  //UPDATE


  Future<bool> addGroupMessage(GroupChat groupChat) async{
    try {
      await chats.doc(groupChat.id).update(groupChat.toJson());
      return true;
    } catch (e) {
      return Future.error(e); // return error
    }
  }



}


