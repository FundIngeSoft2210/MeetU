import 'package:json_annotation/json_annotation.dart';
part 'message.g.dart';

@JsonSerializable(explicitToJson: true)

class Message{
  @JsonKey(name: 'author_id')
  String author_id;
  @JsonKey(name: 'date')
  DateTime date;
  @JsonKey(name: 'id')
  late String id;

  Message(this.author_id, this.date);

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);


}