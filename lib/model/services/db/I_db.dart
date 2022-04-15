import 'package:cloud_firestore/cloud_firestore.dart';

import '../../entities/student.dart';



abstract class I_DBProvider{

  Stream<DocumentSnapshot<Map<String, dynamic>>> currentUser(String userId);




}