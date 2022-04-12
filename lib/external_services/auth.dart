import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  static final _auth = FirebaseAuth.instance;
  Stream<User?> get authStatus=>_auth.authStateChanges(); // Se obtiene el estado actual de auntenticación
// se mira si ya hay alguien autenticado



}