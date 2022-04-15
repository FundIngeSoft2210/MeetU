import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meet_u/model/entities/student.dart';

class Database{


  final users = FirebaseFirestore.instance.collection('users');


  //READ
  Stream<DocumentSnapshot<Map<String, dynamic>>> currentUser(String userId){
    return users.doc(userId).snapshots();
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



}


