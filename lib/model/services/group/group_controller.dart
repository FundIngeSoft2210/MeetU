import 'package:meet_u/model/entities/admin.dart';
import 'package:meet_u/model/entities/group.dart';
import 'package:meet_u/model/entities/student.dart';
import 'I_group.dart';


class GroupController implements I_Group{
  @override
  addGroup(Admin admin, Group group) async{
    await admin.addGroup(group);
  }

  @override
  Future<bool> joinGroup(String groupId, Student student)async{
   return  await student.joinGroup(groupId);
  }



}