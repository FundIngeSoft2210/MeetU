import 'package:meet_u/model/entities/admin.dart';
import 'package:meet_u/model/entities/student.dart';
import '../../entities/group.dart';


abstract class I_Group{

  addGroup(Admin admin,Group group);
  Future<bool> joinGroup(String groupId, Student student);


}