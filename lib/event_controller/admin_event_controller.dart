import 'package:meet_u/model/services/group/I_group.dart';
import 'package:meet_u/model/services/group/group_controller.dart';

import '../model/entities/admin.dart';
import '../model/entities/group.dart';
import '../utils/utils.dart';

class AdminEventController{

  final I_Group _i_group=GroupController();

  addGroup(Admin admin, String groupName, String groupImageUrl) async{
    await _i_group.addGroup(admin, Group(groupName, groupImageUrl));
    Utils.showSnackBar("Se agregó el grupo");
  }

}