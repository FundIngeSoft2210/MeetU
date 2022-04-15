// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupChat _$GroupChatFromJson(Map<String, dynamic> json) => GroupChat(
      json['group_id'] as String,
    )
      ..id = json['id'] as String
      ..chatType = $enumDecode(_$ChatTypeEnumMap, json['chatType'])
      ..messages = (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GroupChatToJson(GroupChat instance) => <String, dynamic>{
      'id': instance.id,
      'chatType': _$ChatTypeEnumMap[instance.chatType],
      'messages': instance.messages?.map((e) => e.toJson()).toList(),
      'group_id': instance.group_id,
    };

const _$ChatTypeEnumMap = {
  ChatType.private: 'private',
  ChatType.group: 'group',
};
