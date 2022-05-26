import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_u/model/entities/career.dart';
import 'package:meet_u/model/entities/career_type.dart';
import 'package:meet_u/model/entities/gender.dart';
import '../model/entities/student.dart';
import '../model/services/auth/I_auth.dart';
import '../model/services/auth/auth_controller.dart';
import '../model/services/db/I_db.dart';
import '../model/services/db/db_controller.dart';
import '../model/services/sign_up/I_sign_up.dart';
import '../model/services/sign_up/sign_up_controller.dart';
import '../ui/screens/student/verify_email_screen/verifyEmailScreen.dart';
import '../utils/utils.dart';


class EventController{

  final I_DBProvider _i_dbProvider=DBController();
  final I_Auth _i_auth= AuthController();
  final I_SignUp _i_signUp=SignUpController();

  //DB
  Stream<DocumentSnapshot<Map<String, dynamic>>> currentUser(String userId) {return _i_dbProvider.currentUser(userId);}


  //AUTH


  sendVerificationEmail() async {
    try {
      await _i_auth.sendVerificationEmail();
      await Future.delayed(const Duration(seconds: 5));
    } catch (e) {
      Utils.showSnackBar("Debe esperar unos segundos antes de volver a enviar el correo de verificación");
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
        Utils.showSnackBar("No existe esta cuenta o los datos ingresados son incorrectos.");
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
      Utils.showSnackBar(e.message);
    }
  }


  finishSignUp(Student student)async{
    await _i_signUp.finishSignUp(student);
  }




}