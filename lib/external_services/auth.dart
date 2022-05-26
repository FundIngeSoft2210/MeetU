import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  static final _auth = FirebaseAuth.instance;
  Stream<User?> get authStatus=>_auth.authStateChanges();


  bool checkEmailIsVerified(){return _auth.currentUser!.emailVerified;}

  sendVerificationEmail()async{await _auth.currentUser!.sendEmailVerification();}

  reload()async {await _auth.currentUser!.reload();}


   loginUsingEmailPassword(String email,String password) async {
     await _auth.signInWithEmailAndPassword(email: email, password: password);
  }


  Future<UserCredential> createUserWithEmailAndPassword(String email,String password) async {
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  signOut(){_auth.signOut();}

}
