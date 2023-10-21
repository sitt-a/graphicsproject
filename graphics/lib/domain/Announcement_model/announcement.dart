
import 'package:json_annotation/json_annotation.dart';

part 'announcement.g.dart';

@JsonSerializable(explicitToJson: true)
class Announcement {
  @JsonKey(name: "_id")
  String announcementId;
  String title;
  String body;
  String author;
  
  

  Announcement({
    required this. announcementId,
    required this.title,
    required this.author,
    required this.body,
   
  });

  factory Announcement.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "id": announcementId,
      'title': title,
      'author': author,
      'description': body,
      
    };
  }
}
