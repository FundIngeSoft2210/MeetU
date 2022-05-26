import 'package:meet_u/model/entities/admin.dart';
import 'package:meet_u/model/entities/student.dart';
import '../../entities/group.dart';


abstract class I_GroupEvent{

  addEvent(String groupid, String description, String place, DateTime date, Student student);


}