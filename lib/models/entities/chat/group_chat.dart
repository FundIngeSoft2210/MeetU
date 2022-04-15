import 'package:json_annotation/json_annotation.dart';
import 'package:meet_u/models/entities/chat/chat.dart';
import 'package:meet_u/models/entities/chat/message.dart';
import 'package:meet_u/models/entities/chat_type.dart';
part 'group_chat.g.dart';

@JsonSerializable(explicitToJson: true)
class GroupChat extends Chat{

  @JsonKey(name: 'group_id')
  String group_id;
  GroupChat(this.group_id) : super(ChatType.group);

  factory GroupChat.fromJson(Map<String, dynamic> json) => _$GroupChatFromJson(json);
  Map<String, dynamic> toJson() => _$GroupChatToJson(this);

}