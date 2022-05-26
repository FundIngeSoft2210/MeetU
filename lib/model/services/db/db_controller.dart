import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../external_services/database.dart';
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



}