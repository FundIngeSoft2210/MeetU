import 'package:meet_u/model/entities/student.dart';

import 'I_group_event.dart';


class GroupEventController implements I_GroupEvent{
  @override
  addEvent(String groupid, String description, String place, DateTime date, Student student)async{
    await student.addEvent(groupid, description, place, date);
  }



}