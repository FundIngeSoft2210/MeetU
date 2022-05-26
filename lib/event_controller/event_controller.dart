import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_u/model/entities/career.dart';
import 'package:meet_u/model/entities/career_type.dart';
import 'package:meet_u/model/entities/chat/group_chat.dart';
import 'package:meet_u/model/entities/gender.dart';
import 'package:meet_u/model/services/event/I_group_event.dart';
import 'package:meet_u/model/services/event/group_event_controller.dart';
import 'package:meet_u/model/services/message/I_message.dart';
import 'package:meet_u/model/services/message/message_controller.dart';
import '../model/entities/student.dart';
import '../model/services/Post/I_Post.dart';
import '../model/services/Post/PostController.dart';
import '../model/services/auth/I_auth.dart';
import '../model/services/auth/auth_controller.dart';
import '../model/services/db/I_db.dart';
import '../model/services/db/db_controller.dart';
import '../model/services/group/I_group.dart';
import '../model/services/group/group_controller.dart';
import '../model/services/sign_up/I_sign_up.dart';
import '../model/services/sign_up/sign_up_controller.dart';
import '../ui/screens/student/verify_email_screen/verifyEmailScreen.dart';
import '../utils/utils.dart';


class EventController{

  final I_DBProvider _i_dbProvider=DBController();
  final I_Auth _i_auth= AuthController();
  final I_SignUp _i_signUp=SignUpController();
  final I_Message _i_message=MessageController();
  final I_Post _i_post=PostController();
  final I_Group _i_group=GroupController();
  final I_GroupEvent _i_groupEvent=GroupEventController();

  //DB
  Stream<DocumentSnapshot<Map<String, dynamic>>> currentUser(String userId) {return _i_dbProvider.currentUser(userId);}

  Stream<QuerySnapshot<Map<String, dynamic>>> getStudentGroups(String studentId){return _i_dbProvider.getStudentGroups(studentId);}

  Future<DocumentSnapshot<Map<String, dynamic>>> getGroup(String groupId)async{return await _i_dbProvider.getGroup(groupId);}

  Stream<QuerySnapshot<Map<String, dynamic>>> getGroupChat(String groupId){return _i_dbProvider.getGroupChat(groupId);}

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllGroups(){return _i_dbProvider.getAllGroups();}

  Stream<DocumentSnapshot<Map<String, dynamic>>> getGroupStream(String groupId){return _i_dbProvider.getGroupStream(groupId);}

  Stream<QuerySnapshot<Map<String, dynamic>>> getGroupPosts(String groupId) {return _i_dbProvider.getGroupPosts(groupId);}

  Stream<QuerySnapshot<Map<String, dynamic>>> getGroupEvents(String groupId) {return _i_dbProvider.getGroupEvents(groupId);}

  Stream<QuerySnapshot<Map<String, dynamic>>> getStudentEvents(String studentId) {return _i_dbProvider.getStudentEvents(studentId);}


  //AUTH
  sendVerificationEmail() async {
    try {
      await _i_auth.sendVerificationEmail();
      await Future.delayed(const Duration(seconds: 5));
    } catch (e) {
      Utils.showSnackBar("Debe esperar unos segundos antes de volver a enviar el correo de verificación",Colors.red);
    }
  }

  bool checkEmailIsVerified(){
    _i_auth.reload();
    return _i_auth.checkEmailIsVerified();
  }

  loginUsingEmailPassword(String email, String password)async{
    try {
      await _i_auth.loginUsingEmailPassword(email, password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        Utils.showSnackBar("No existe esta cuenta o los datos ingresados son incorrectos.",Colors.red);
      }
    }
  }


  signOut(){_i_auth.signOut();}



  //SIGN UP

  studentSignUp(String email, String password,String name, String lastName,CareerType careerType,int semester,Gender gender,BuildContext context)async{
    try {
      UserCredential credential= await _i_auth.createUserWithEmailAndPassword(email, password);
      Student newStudent=Student();
      _i_signUp.initMainInfo(email, name, lastName,credential.user!.uid,Career(semester, careerType),gender,newStudent);
      await sendVerificationEmail();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  VerifyEmailScreen(student: newStudent)));
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message,Colors.red);
    }
  }


  finishSignUp(Student student)async{
    await _i_signUp.finishSignUp(student);
  }



  //MESSAGE

  sendGroupMessage(String message,Student student, GroupChat groupChat)async{_i_message.sendGroupMessage(message, groupChat, student);}

  //POST
  add_Post(Student student, String groupid, String description, File? file, List<String>? tags)async{
    await _i_post.add_Post(student, groupid, description, file, tags);
  }



  //GROUP
  joinGroup(String groupId, Student student)async{
    await _i_group.joinGroup(groupId, student);
    Utils.showSnackBar("Te uniste a este nuevo grupo!",Colors.green);
  }

  //EVENTS
  addEvent(String groupid, String description, String place, DateTime date, Student student)async{await _i_groupEvent.addEvent(groupid, description, place, date, student);}
}