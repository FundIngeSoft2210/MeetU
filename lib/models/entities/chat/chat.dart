import 'package:meet_u/models/entities/chat_type.dart';
import 'package:meet_u/models/entities/chat/message.dart';

abstract class Chat{

  late String id;
  ChatType chatType;
  List<Message>? messages;

  Chat(this.chatType);


}