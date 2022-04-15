import 'package:json_annotation/json_annotation.dart';
part 'event.g.dart';


@JsonSerializable(explicitToJson: true)

class Event{

  @JsonKey(name: 'author_id')
  String author_id;
  @JsonKey(name: 'group_id')
  String group_id;
  @JsonKey(name: 'participants')
  List<String>?participants;
  @JsonKey(name: 'date')
  DateTime date;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'place')
  String place;
  @JsonKey(name: 'id')
  late String id;

  Event(this.author_id, this.group_id, this.participants, this.date,
      this.description, this.place);


  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);


}