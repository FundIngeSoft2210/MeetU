import 'dart:ffi';
import 'dart:io';

import 'package:meet_u/model/entities/student.dart';
import 'package:meet_u/model/services/Post/I_Post.dart';

class PostController implements I_Post{
  @override
  add_Post(Student student, String groupid, String description, File? file, List<String>? tags)async{
    await student.addPost(groupid, description, file, tags);
  }

}