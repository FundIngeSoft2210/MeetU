import 'package:json_annotation/json_annotation.dart';
part 'support_message.g.dart';


@JsonSerializable(explicitToJson: true)
class SupportMessage{

  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'date')
  DateTime date;
  @JsonKey(name: 'student_id')
  String student_id;
  @JsonKey(name: 'id')
  String id;

  SupportMessage(this.message, this.date, this.student_id, this.id);

  factory SupportMessage.fromJson(Map<String, dynamic> json) => _$SupportMessageFromJson(json);
  Map<String, dynamic> toJson() => _$SupportMessageToJson(this);


}