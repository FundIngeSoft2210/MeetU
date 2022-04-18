import 'dart:io';

import 'package:meet_u/model/entities/student.dart';

abstract class I_Post{
  add_Post(Student student, String groupid, String description, File? file, List<String>? tags);

}