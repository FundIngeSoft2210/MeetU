import 'package:meet_u/model/entities/chat/group_chat.dart';
import 'package:meet_u/model/entities/student.dart';
import 'package:meet_u/model/services/message/I_message.dart';


class MessageController implements I_Message{
  @override
  sendGroupMessage(String message, GroupChat groupChat, Student student)async{
    await student.sendGroupMessage(message, groupChat);
  }




}