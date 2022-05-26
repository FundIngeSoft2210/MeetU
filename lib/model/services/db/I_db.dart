import 'package:cloud_firestore/cloud_firestore.dart';

import '../../entities/student.dart';



abstract class I_DBProvider{

  Stream<DocumentSnapshot<Map<String, dynamic>>> currentUser(String userId);

  Stream<QuerySnapshot<Map<String, dynamic>>> getStudentGroups(String studentId);

  Future<DocumentSnapshot<Map<String, dynamic>>> getGroup(String groupId);

  Stream<QuerySnapshot<Map<String, dynamic>>> getGroupChat(String groupId);

}