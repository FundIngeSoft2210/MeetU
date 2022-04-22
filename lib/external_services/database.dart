import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../utils/utils.dart';

/// Permite a un usuario iniciar sesión
/// Arroja [user-not-found] si el usuario dado no se encuentra en la base de datos
class Database{

  static Future<User?> loginUsingEmailPassword(
      {required String email,
        required String password,
        required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        Utils.showSnackBar("No existe un usuario con ese email");
      }
    }

    return user;
  }

  


}