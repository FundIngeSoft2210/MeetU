import 'package:flutter_test/flutter_test.dart';
import 'package:meet_u/event_controller/event_controller.dart';
import 'package:meet_u/model/entities/career_type.dart';
import 'package:meet_u/model/entities/student.dart';

void main(){
  final CareerType carrera;
  final Student estudiante = new Student ();

  test('Actualizar información usuario',(){
    final update=EventController();
    expect(update.updateStudent(estudiante),true);
  });

}