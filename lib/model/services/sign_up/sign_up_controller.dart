
import 'package:meet_u/model/entities/career.dart';
import 'package:meet_u/model/entities/student.dart';

import '../../entities/gender.dart';
import 'I_sign_up.dart';

class SignUpController implements I_SignUp{

  @override
  finishSignUp(Student student)async{
    student.finishSignUp();
  }

  @override
  initMainInfo(String email, String name, String lastName,String id,Career career,Gender gender,Student student) {
    student.initMainInfo(email, name, lastName,id,career,gender);
  }







}
