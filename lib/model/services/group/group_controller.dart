import 'package:meet_u/model/entities/admin.dart';
import 'package:meet_u/model/entities/group.dart';
import 'I_group.dart';


class GroupController implements I_Group{
  @override
  addGroup(Admin admin, Group group) async{
    await admin.addGroup(group);
  }









}