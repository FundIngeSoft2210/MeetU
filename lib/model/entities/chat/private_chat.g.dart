// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivateChat _$PrivateChatFromJson(Map<String, dynamic> json) => PrivateChat()
  ..id = json['id'] as String
  ..chatType = $enumDecode(_$ChatTypeEnumMap, json['chatType'])
  ..messages = (json['messages'] as List<dynamic>?)
      ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
      .toList()
  ..members =
      (json['members'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$PrivateChatToJson(PrivateChat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chatType': _$ChatTypeEnumMap[instance.chatType],
      'messages': instance.messages?.map((e) => e.toJson()).toList(),
      'members': instance.members,
    };

const _$ChatTypeEnumMap = {
  ChatType.private: 'private',
  ChatType.group: 'group',
};
