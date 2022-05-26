import 'package:meet_u/model/entities/chat/group_chat.dart';
import 'package:meet_u/model/entities/student.dart';



abstract class I_Message{

  sendGroupMessage(String message,GroupChat groupChat,Student student);


}