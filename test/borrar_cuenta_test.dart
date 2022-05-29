import 'package:flutter_test/flutter_test.dart';
import 'package:meet_u/event_controller/event_controller.dart';

void main(){
  final String userID="20455465";
  final String userIDInvalido="abc";

  test('Borrar usuario',(){
    final borrar=EventController();
    expect(borrar.deleteUser(userID),true);
  });
  test('Borrar usuario inválido',(){
    final borrar=EventController();
    expect(borrar.deleteUser(userIDInvalido),false);
  });
}