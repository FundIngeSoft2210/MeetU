import 'package:firebase_auth/firebase_auth.dart';

abstract class I_Auth {
  Stream<User?> getAuthStatus();

  loginUsingEmailPassword(String email, String password);

  Future<UserCredential> createUserWithEmailAndPassword(String email, String password);

  sendVerificationEmail();

  bool checkEmailIsVerified();

  reload();

  signOut();

  deleteFromAuth();


}