import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../external_services/database.dart';
import '../../entities/student.dart';
import 'I_db.dart';


class DBController implements I_DBProvider{

  final Database _database=Database();

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> currentUser(String userId) {
    return _database.currentUser(userId);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getStudentGroups(String studentId) {
    return _database.getStudentGroups(studentId);
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getGroup(String groupId)async{
    return await _database.getGroup(groupId);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getGroupChat(String groupId) {
    return _database.getGroupChat(groupId);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllGroups() {
    return _database.getAllGroups();
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getGroupStream(String groupId){
    return _database.getGroupStream(groupId);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getGroupPosts(String groupId) {
    return _database.getGroupPosts(groupId);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getGroupEvents(String groupId) {
    return _database.getGroupEvents(groupId);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getStudentEvents(String studentId) {
    return _database.getStudentEvents(studentId);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getGroupMembers(String groupId) {
    return _database.getGroupMemebers(groupId);
  }

  @override
  Future<bool> updateStudent(Student student){
    return _database.updateStudent(student);
  }

  Future<bool> deleteUser(String userId){
    return _database.deleteUser(userId);
  }

}