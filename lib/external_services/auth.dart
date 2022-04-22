import 'package:firebase_auth/firebase_auth.dart';

///Contiene métodos que se conectan con los servicios de autenticación de la base de datos.
class AuthService{

  static final _auth = FirebaseAuth.instance;

  ///Verifica si el usuario tiene la sesión iniciada o no
  Stream<User?> get authStatus=>_auth.authStateChanges();

  /// Verifica si el email ya ha sido verificado
  bool checkEmailIsVerified(){return _auth.currentUser!.emailVerified;}

  /// Envía el email de verificación al usuario
  sendVerificationEmail()async{await _auth.currentUser!.sendEmailVerification();}

  /// Refresca la información del usuario actual
  reload()async {await _auth.currentUser!.reload();}

  /// Cierra la sesión del usuario actual
  signOut(){_auth.signOut();}


}