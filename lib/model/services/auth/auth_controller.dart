import 'package:firebase_auth/firebase_auth.dart';

import '../../../external_services/auth.dart';
import 'I_auth.dart';


class AuthController implements I_Auth{

  final AuthService _authService= AuthService();

  @override
  Stream<User?> getAuthStatus() {return _authService.authStatus;}


  @override
  loginUsingEmailPassword(String email, String password)async{
    await _authService.loginUsingEmailPassword(email, password);
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword(String email,String password) async {
    return await _authService.createUserWithEmailAndPassword(email, password);
  }

  @override
  sendVerificationEmail() {
    _authService.sendVerificationEmail();
  }

  @override
  bool checkEmailIsVerified() {
    return _authService.checkEmailIsVerified();
  }

  @override
  reload()async{
    await _authService.reload();
  }

  @override
  signOut() {
    _authService.signOut();
  }




}