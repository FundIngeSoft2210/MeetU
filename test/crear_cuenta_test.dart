import 'package:flutter_test/flutter_test.dart';
import 'package:meet_u/event_controller/event_controller.dart';

void main(){
  //¿Hay restricciones para la contraseña?

  //Probar cuenta javeriana
  final String email="davidmhenaop@javeriana.edu.co";
  final String emailIncorrecto="davidmhenaop@gmail.com";
  test('El correo se ha verificado',(){
    final ver=EventController();
    expect(ver.checkEmailIsVerified,true);
  });

  test ('el correo debe ser de la universidad javeriana',(){
    expect(email.endsWith("javeriana.edu.co"),true);
  });
  test ('correo que no es de la javeriana',(){
    expect(emailIncorrecto.endsWith("javeriana.edu.co"),false);
  });

}