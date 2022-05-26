import 'package:meet_u/model/entities/chat/message.dart';
import 'package:meet_u/model/entities/chat_type.dart';


abstract class Chat{

  late String id;
  ChatType chatType;
  List<Message>? messages;

  Chat(this.chatType);


}