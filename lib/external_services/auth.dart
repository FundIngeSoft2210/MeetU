import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  static final _auth = FirebaseAuth.instance;
  Stream<User?> get authStatus=>_auth.authStateChanges();


  bool checkEmailIsVerified(){return _auth.currentUser!.emailVerified;}

  sendVerificationEmail()async{await _auth.currentUser!.sendEmailVerification();}

  reload()async {await _auth.currentUser!.reload();}

  signOut(){_auth.signOut();}


}