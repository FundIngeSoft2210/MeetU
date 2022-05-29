import 'package:flutter_test/flutter_test.dart';
import 'package:meet_u/event_controller/event_controller.dart';

void main(){
  final String email="davidmhenaop@javeriana.edu.co";
  final String emailInvalido="juanperez@gmail.com";
  final String password="mateo1234";
  test('Iniciar sesión',(){
    final logIn=EventController();
    expect(logIn.loginUsingEmailPassword(email, password),true);
  });
  test('Iniciar sesión inválido',(){
    final logIn=EventController();
    expect(logIn.loginUsingEmailPassword(emailInvalido, password),true);
  });
}