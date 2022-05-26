import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meet_u/model/entities/student.dart';

import '../../../external_services/database.dart';
import 'I_db.dart';


class DBController implements I_DBProvider{

  final Database _database=Database();

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> currentUser(String userId) {
    return _database.currentUser(userId);
  }



}