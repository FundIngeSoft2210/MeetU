import 'package:meet_u/model/entities/career.dart';
import 'package:meet_u/model/entities/student.dart';

import '../../entities/gender.dart';

abstract class I_SignUp{
  initMainInfo(String email,String name, String lastName,String id,Career career,Gender gender,Student student);
  finishSignUp(Student student);
}