import 'package:json_annotation/json_annotation.dart';
import 'package:meet_u/models/entities/chat/chat.dart';
import 'package:meet_u/models/entities/chat_type.dart';

import 'message.dart';
part 'private_chat.g.dart';

@JsonSerializable(explicitToJson: true)

class PrivateChat extends Chat{

  @JsonKey(name: 'members')
  List<String>? members;

  PrivateChat() : super(ChatType.private);

  factory PrivateChat.fromJson(Map<String, dynamic> json) => _$PrivateChatFromJson(json);
  Map<String, dynamic> toJson() => _$PrivateChatToJson(this);


}